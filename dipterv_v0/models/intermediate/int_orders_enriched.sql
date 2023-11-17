with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),

customers as (
    select * from {{ ref('int_customers_enriched') }}
),

orders_enriched as (
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
        c.customer_name,
        c.nation_name,
        c.region_id
    from orders o
    inner join customers c on o.customer_id = c.customer_id
)

select * from orders_enriched