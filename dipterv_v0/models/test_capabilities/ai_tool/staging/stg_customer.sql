-- staging model for tpch customer
--time to develop code: 7.88 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

-- staging model for tpch customer

with source as (

    select * from {{ source('tpch','tpch_customer') }}

),

renamed as (

    select
        CUSTKEY as customer_key,
        NAME as customer_name,
        ADDRESS as address,
        NATIONKEY as nation_key,
        PHONE as phone,
        ACCTBAL as account_balance,
        MKTSEGMENT as market_segment,
        COMMENT as comment

    from source

)

select * from renamed