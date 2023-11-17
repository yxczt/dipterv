with customers as (
    select * from {{ ref('int_customers_enriched') }}
),

orders as (
    select * from {{ ref('int_orders_enriched') }}
),

suppliers as (
    select * from {{ ref('int_suppliers_enriched') }}
),

lineitems as (
    select * from {{ ref('stg_tpch_lineitem') }}
),

orders_joined as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.total_price as order_total_price,
        o.order_date,
        o.order_priority,
        c.customer_name,
        c.account_balance as customer_account_balance,
        c.nation_name as customer_nation,
        c.region_id as customer_region_id,
        c.market_segment,
        s.supplier_id,
        s.supplier_name,
        s.nation_name as supplier_nation,
        s.region_id as supplier_region_id,
        s.account_balance as supplier_account_balance,
        li.quantity as lineitem_quantity,
        li.extended_price as lineitem_extended_price,
        li.discount as lineitem_discount,
        li.tax as lineitem_tax
    from orders o
    inner join customers c on o.customer_id = c.customer_id
    left join lineitems li on o.order_id = li.order_id
    left join suppliers s on li.supplier_id = s.supplier_id
)

select * from orders_joined