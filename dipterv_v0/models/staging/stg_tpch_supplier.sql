-- stg_tpch_supplier.sql

with source as (
    select
        SUPPKEY as supplier_id,
        NAME as supplier_name,
        ADDRESS as supplier_address,
        NATIONKEY as nation_id,
        PHONE as supplier_phone,
        ACCTBAL as account_balance,
        COMMENT as supplier_comment
    from {{ source('tpch', 'tpch_supplier') }}
)

select * from source
