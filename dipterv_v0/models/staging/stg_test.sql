--stg_tpch_part

with source as (

    select * from {{ source('tpch','tpch_part') }}

),

renamed as (

    select
        -- ids
        PARTKEY as part_key,
        
        -- strings
        NAME as name,
        MFGR as manufacturer,
        BRAND as brand,
        TYPE as type,
        CONTAINER as container,
        COMMENT as comment,

        -- numerics
        SIZE as size,
        RETAILPRICE as retail_price

    from source

)

select * from renamed