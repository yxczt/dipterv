with source as (

    select * from {{ source('tpch','tpch_customer') }}

),

renamed as (

    select
        CUSTKEY as custkey,
        NAME as name,
        ADDRESS as address,
        NATIONKEY as nationkey,
        PHONE as phone,
        ACCTBAL as acctbal,
        MKTSEGMENT as mktsegment,
        COMMENT as comment
    from source

)

select * from renamed