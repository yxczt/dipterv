with source as (

    select * from {{ source('tpch','tpch_orders') }}

),

renamed as (

    select
        ORDERKEY as order_key,
        CUSTKEY as customer_key,
        ORDERSTATUS as order_status,
        TOTALPRICE as total_price,
        ORDERDATE as order_date,
        ORDERPRIORITY as order_priority,
        SHIPPRIORITY as ship_priority,
        CLERK as clerk,
        COMMENT as comment

    from source

)

select * from renamed