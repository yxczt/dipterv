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

-- custom test for checking negative discount price in the model int_orders_aggregated

```sql
-- tests/generic/test_negative_discount_price.sql
{% test negative_discount_price(model) %}

    select
        order_id,
        total_discount_price
    from {{ model }}
    where total_discount_price < 0

{% endtest %}
```

-- custom test for testing if the latest order date is later than or at the same time as first order date in int_customer_ordering_habits

--tests/generic/test_latest_order_date_is_later_or_equal_to_first_order_date.sql
{# {% test test_latest_order_date_is_later_or_equal_to_first_order_date(model) %}

    select
        customer_id,
        first_order_date,
        latest_order_date
    from {{ model }}
    where latest_order_date < first_order_date

{% endtest %} #}

-- custom test for checking if a customer's orders' revenue summarized is equal to a customer's generated revenue in int_revenue_per_customer

-- tests/generic/test_customer_revenue_equality.sql
{% test customer_revenue_equality(model) %}

WITH customer_order_revenue AS (
    SELECT
        customer_id,
        SUM(total_order_value) AS total_revenue_from_orders
    FROM {{ ref('int_orders_aggregated') }}
    GROUP BY customer_id
),

customer_revenue AS (
    SELECT
        customer_id,
        total_revenue
    FROM {{ ref('int_revenue_per_customer') }}
)

SELECT
    c.customer_id,
    c.total_revenue AS customer_total_revenue,
    co.total_revenue_from_orders AS order_total_revenue
FROM customer_revenue c
LEFT JOIN customer_order_revenue co ON c.customer_id = co.customer_id
WHERE c.total_revenue <> co.total_revenue_from_orders
  OR co.total_revenue_from_orders IS NULL

{% endtest %}

-- custom test for checking if a customer's orders' order_total_price summarized in mart_orders, is equal to a customer's generated revenue in int_revenue_per_customer

```sql
with customer_orders as (
    select
        customer_id,
        sum(total_price) as total_orders_price
    from {{ ref('mart_orders') }}
    group by customer_id
),

customer_revenue as (
    select
        customer_id,
        total_revenue
    from {{ ref('int_revenue_per_customer') }}
)

select
    co.customer_id,
    co.total_orders_price,
    cr.total_revenue
from customer_orders co
join customer_revenue cr on co.customer_id = cr.customer_id
where co.total_orders_price <> cr.total_revenue
```
```sql
with customer_revenue_mart as (
    select
        customer_id,
        sum(total_revenue) as total_revenue_mart
    from {{ ref('mart_orders') }}
    group by customer_id
),

customer_revenue_int as (
    select
        customer_id,
        total_revenue as total_revenue_int
    from {{ ref('int_revenue_per_customer') }}
),

revenue_comparison as (
    select
        crm.customer_id,
        crm.total_revenue_mart,
        cri.total_revenue_int,
        case
            when crm.total_revenue_mart = cri.total_revenue_int then 'Match'
            else 'Mismatch'
        end as revenue_status
    from customer_revenue_mart crm
    join customer_revenue_int cri
    on crm.customer_id = cri.customer_id
)

select *
from revenue_comparison
where revenue_status = 'Mismatch'
```
```sql
with customer_orders_revenue as (
    select
        c.customer_id,
        sum(o.total_price) as total_orders_revenue
    from {{ ref('mart_customers_orders_suppliers') }} o
    join {{ ref('mart_customers') }} c on o.customer_id = c.customer_id
    group by c.customer_id
),
customer_revenue as (
    select
        customer_id,
        total_revenue
    from {{ ref('int_revenue_per_customer') }}
),
revenue_comparison as (
    select
        co.customer_id,
        co.total_orders_revenue,
        cr.total_revenue,
        case
            when co.total_orders_revenue = cr.total_revenue then 'Match'
            else 'Mismatch'
        end as revenue_status
    from customer_orders_revenue co
    join customer_revenue cr on co.customer_id = cr.customer_id
)
select *
from revenue_comparison
where revenue_status = 'Mismatch'
```

```sql
-- tests/generic/test_customer_revenue_equality.sql

{% test customer_revenue_equality(model) %}

with customer_orders_revenue as (
    select
        customer_id,
        sum(total_order_value) as total_orders_revenue
    from {{ model }}
    group by customer_id
),

customer_revenue as (
    select
        customer_id,
        total_revenue
    from {{ model }}
)

select 
    cor.customer_id,
    cor.total_orders_revenue,
    cr.total_revenue
from customer_orders_revenue cor
join customer_revenue cr
on cor.customer_id = cr.customer_id
where cor.total_orders_revenue != cr.total_revenue

{% endtest %}
```
-- tests/generic/test_customer_order_revenue_equality.sql
{% test customer_order_revenue_equality(model) %}

with customer_orders_revenue as (
    select
        customer_id,
        sum(total_order_value) as total_revenue_from_orders
    from {{ model }}
    group by customer_id
),

customer_revenue as (
    select
        customer_id,
        total_revenue
    from {{ model }}
)

select
    co.customer_id,
    co.total_revenue_from_orders,
    cr.total_revenue
from customer_orders_revenue co
join customer_revenue cr
    on co.customer_id = cr.customer_id
where co.total_revenue_from_orders != cr.total_revenue

{% endtest %}
--tests/generic/test_customer_revenue_equality.sql
{% test test_customer_revenue_equality(model) %}

with customer_orders_revenue as (
    select
        customer_id,
        sum(total_order_value) as total_revenue
    from {{ model }}
    group by customer_id
),

customer_revenue as (
    select
        customer_id,
        total_revenue
    from {{ model }}
)

select
    co.customer_id,
    co.total_revenue as orders_revenue,
    cr.total_revenue as customer_revenue
from customer_orders_revenue co
join customer_revenue cr
    on co.customer_id = cr.customer_id
where co.total_revenue <> cr.total_revenue

{% endtest %}
-- tests/generic/test_customer_revenue_equality.sql
{% test test_customer_revenue_equality(model) %}

WITH customer_orders_revenue AS (
    SELECT
        customer_id,
        SUM(total_price) AS total_orders_revenue
    FROM {{ model }}
    WHERE resource = 'int_customers_orders_analyzed'
    GROUP BY customer_id
),

customer_revenue AS (
    SELECT
        customer_id,
        total_revenue
    FROM {{ model }}
    WHERE resource = 'int_revenue_per_customer'
)

SELECT
    co.customer_id,
    co.total_orders_revenue,
    cr.total_revenue
FROM customer_orders_revenue co
JOIN customer_revenue cr
ON co.customer_id = cr.customer_id
WHERE co.total_orders_revenue <> cr.total_revenue

{% endtest %}