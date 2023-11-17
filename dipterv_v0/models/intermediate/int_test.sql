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
