--Please make a connection between customers, orders and suppliers!
```sql
-- int_customers_enriched.sql

with customers as (
    select * from {{ ref('stg_tpch_customer') }}
),

nations as (
    select * from {{ ref('stg_tpch_nation') }}
),

enriched_customers as (
    select
        c.customer_id,
        c.customer_name,
        c.customer_address,
        c.customer_phone,
        c.account_balance,
        c.market_segment,
        c.customer_comment,
        n.nation_name,
        n.region_id as customer_region_id
    from customers c
    left join nations n on c.nation_id = n.nation_id
)

select * from enriched_customers
```

```sql
-- int_orders_enriched.sql

with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),

customers as (
    select * from {{ ref('int_customers_enriched') }}
),

suppliers as (
    select * from {{ ref('stg_tpch_supplier') }}
),

lineitems as (
    select * from {{ ref('stg_tpch_lineitem') }}
),

suppliers_enriched as (
    select
        s.supplier_id,
        s.supplier_name,
        s.supplier_address,
        s.supplier_phone,
        s.account_balance as supplier_account_balance,
        s.supplier_comment,
        n.nation_name as supplier_nation_name,
        n.region_id as supplier_region_id
    from suppliers s
    left join {{ ref('stg_tpch_nation') }} n on s.nation_id = n.nation_id
),

orders_suppliers_joined as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.total_price,
        o.order_date,
        o.order_priority,
        o.ship_priority,
        o.clerk,
        o.order_comment,
        li.part_id,
        li.supplier_id,
        esi.supplier_name,
        esi.supplier_nation_name,
        esi.supplier_region_id
    from orders o
    left join lineitems li on o.order_id = li.order_id
    left join suppliers_enriched esi on li.supplier_id = esi.supplier_id
)

select
    oe.order_id,
    oe.customer_id,
    oe.order_status,
    oe.total_price,
    oe.order_date,
    oe.order_priority,
    oe.ship_priority,
    oe.clerk,
    oe.order_comment,
    oe.part_id,
    oe.supplier_id,
    oe.supplier_name,
    oe.supplier_nation_name,
    oe.supplier_region_id,
    c.customer_name,
    c.customer_address,
    c.customer_phone,
    c.account_balance as customer_account_balance,
    c.market_segment,
    c.customer_comment,
    c.nation_name as customer_nation_name,
    c.customer_region_id
from orders_suppliers_joined oe
join customers c on oe.customer_id = c.customer_id
```

```sql
-- mart_customer_orders_suppliers.sql

select 
    oe.order_id,
    oe.customer_id,
    oe.customer_name,
    oe.customer_address,
    oe.customer_phone,
    oe.customer_account_balance,
    oe.market_segment,
    oe.customer_comment,
    oe.customer_nation_name,
    oe.customer_region_id,
    oe.order_status,
    oe.total_price,
    oe.order_date,
    oe.order_priority,
    oe.ship_priority,
    oe.order_comment,
    oe.part_id,
    oe.supplier_id,
    oe.supplier_name,
    oe.supplier_nation_name,
    oe.supplier_region_id,
    oe.supplier_account_balance,
    oe.supplier_comment
from {{ ref('int_orders_enriched') }} oe
```
-- Make a connection between customers and orders!

```sql
-- int_customers_orders_joined.sql

with

customers as (

  select * from {{ ref('stg_tpch_customer') }}

),

orders as (

  select * from {{ ref('stg_tpch_orders') }}

),

customers_orders_joined as (

  select 
    customers.customer_id,
    customers.customer_name,
    customers.customer_address,
    customers.nation_id,
    customers.customer_phone,
    customers.account_balance,
    customers.market_segment,
    orders.order_id,
    orders.order_status,
    orders.total_price,
    orders.order_date,
    orders.order_priority,
    orders.ship_priority,
    orders.clerk,
    orders.order_comment
  from customers
  join orders on customers.customer_id = orders.customer_id
)

select * from customers_orders_joined
```

-- Make a connection between customers and orders and aggregate on the customer level!

```sql
-- int_customers_aggregated_orders.sql

with

customers as (

  select * from {{ ref('stg_tpch_customer') }}

),

orders as (

  select * from {{ ref('stg_tpch_orders') }}

),

customer_orders as (

  select 
    customers.customer_id,
    customers.customer_name,
    customers.account_balance,
    customers.market_segment,
    count(orders.order_id) as total_orders,
    sum(orders.total_price) as total_spent
  from customers
  left join orders on customers.customer_id = orders.customer_id
  group by 1,2,3,4
)

select * from customer_orders
```

-- Make a connection between customers and orders and aggregate on the customer level every data that is possible!

```sql
-- int_customers_aggregated_orders.sql

with

customers as (

  select * from {{ ref('stg_tpch_customer') }}

),

orders as (

  select * from {{ ref('stg_tpch_orders') }}

),

customer_orders as (

  select 
    customers.customer_id,
    customers.customer_name,
    customers.account_balance,
    customers.market_segment,
    count(orders.order_id) as total_orders,
    sum(orders.total_price) as total_spent,
    min(orders.order_date) as first_order_date,
    max(orders.order_date) as latest_order_date
  from customers
  left join orders on customers.customer_id = orders.customer_id
  group by 1, 2, 3, 4
)

select * from customer_orders
```

-- Develop a model, that is used to analyze a customers ordering habits!

```sql
-- int_customers_orders_analyzed.sql

with

customers as (

   select * from {{ ref('stg_tpch_customer') }}

),

orders as (

   select * from {{ ref('stg_tpch_orders') }}

),

lineitems as (

   select * from {{ ref('stg_tpch_lineitem') }}

),

customer_orders as (

   select
      customers.customer_id,
      customers.customer_name,
      orders.order_id,
      orders.order_date,
      orders.order_status
   from customers
   join orders on customers.customer_id = orders.customer_id

),

order_lineitems as (

   select
      order_id,
      count(*) as total_lineitems,
      sum(quantity) as total_quantity_ordered,
      sum(extended_price) as total_order_value,
      avg(extended_price) as avg_item_value
   from lineitems
   group by 1

),

orders_analyzed as (

   select
      customer_orders.customer_id,
      customer_orders.customer_name,
      customer_orders.order_id,
      customer_orders.order_date,
      customer_orders.order_status,
      order_lineitems.total_lineitems,
      order_lineitems.total_quantity_ordered,
      order_lineitems.total_order_value,
      order_lineitems.avg_item_value
   from customer_orders
   join order_lineitems on customer_orders.order_id = order_lineitems.order_id

)

select * from orders_analyzed
```