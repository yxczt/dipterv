-- stg_tpch_customer.sql

with source as (
    select
        CUSTKEY as customer_id,
        NAME as customer_name,
        ADDRESS as customer_address,
        NATIONKEY as nation_id,
        PHONE as customer_phone,
        ACCTBAL as account_balance,
        MKTSEGMENT as market_segment,
        COMMENT as customer_comment
    from {{ source('tpch', 'tpch_customer') }}
)

select * from source
