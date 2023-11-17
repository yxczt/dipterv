--insightful model for revenue
with customers as (
    select 
        customer_id, 
        customer_name, 
        customer_address, 
        nation_id, 
        customer_phone, 
        account_balance, 
        market_segment, 
        customer_comment 
    from {{ ref('stg_tpch_customer') }}
),

line_items as (
    select
        order_id,
        part_id,
        supplier_id,
        line_number,
        quantity,
        extended_price,
        discount,
        tax,
        return_flag,
        line_status,
        ship_date,
        commit_date,
        receipt_date,
        ship_instruct,
        ship_mode,
        line_comment
    from {{ ref('stg_tpch_lineitem') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_status,
        total_price,
        order_date,
        order_priority,
        ship_priority,
        clerk,
        order_comment
    from {{ ref('stg_tpch_orders') }}
),

revenue as (
    select 
        c.customer_id,
        c.customer_name,
        o.order_id,
        o.order_status,
        o.total_price,
        sum(li.extended_price * (1 - li.discount)) as revenue
    from customers c
    join orders o on c.customer_id = o.customer_id
    join line_items li on o.order_id = li.order_id
    group by 1, 2, 3, 4, 5
)

select * from revenue