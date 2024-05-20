with source as (

    select * from {{ source('tpch','tpch_orders') }}

),

renamed as (

    select
        ORDERKEY as orderkey,
        CUSTKEY as custkey,
        ORDERSTATUS as orderstatus,
        TOTALPRICE as totalprice,
        ORDERDATE as orderdate,
        ORDERPRIORITY as orderpriority,
        SHIPPRIORITY as shippriority,
        CLERK as clerk,
        COMMENT as comment
    from source

)

select * from renamed