with source as (

    select * from {{ source('tpch','tpch_customer') }}

),

renamed as (

    select
        CUSTKEY as customer_key,
        NAME as name,
        ADDRESS as address,
        NATIONKEY as nation_key,
        PHONE as phone,
        ACCTBAL as account_balance,
        MKTSEGMENT as market_segment,
        COMMENT as comment
    from source

)

select * from renamed