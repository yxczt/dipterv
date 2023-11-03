-- stg_tpch_orders.sql

with source as (
    select
        ORDERKEY as order_id,
        CUSTKEY as customer_id,
        ORDERSTATUS as order_status,
        TOTALPRICE as total_price,
        ORDERDATE as order_date,
        ORDERPRIORITY as order_priority,
        SHIPPRIORITY as ship_priority,
        CLERK as clerk,
        COMMENT as order_comment
    from {{ source('tpch', 'tpch_orders') }}
)

select * from source
