with orders as (
    select
        order_id,
        customer_id,
        order_status,
        total_price,
        order_date,
        order_priority,
        clerk,
        order_comment
    from {{ ref('stg_tpch_orders') }}
),

lineitems as (
    select
        order_id,
        sum(extended_price) as total_extended_price,
        sum((extended_price * (1 - discount))) as total_discount_price,
        sum((extended_price * (1 + tax))) as total_tax_price,
        min(ship_date) as earliest_ship_date,
        count(*) as total_line_items
    from {{ ref('stg_tpch_lineitem') }}
    group by order_id
),

orders_enriched as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.total_price,
        o.order_date,
        o.order_priority,
        o.clerk,
        o.order_comment,
        l.total_extended_price,
        l.total_discount_price,
        l.total_tax_price,
        l.earliest_ship_date,
        l.total_line_items
    from orders o
    left join lineitems l 
        on o.order_id = l.order_id
)

select * from orders_enriched