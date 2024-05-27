-- staging model for tpch part
--time to develop code: 3.92 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

with source as (

    select * from {{ source('tpch','tpch_part') }}

),

renamed as (

    select
        PARTKEY as part_key,
        NAME as name,
        MFGR as manufacturer,
        BRAND as brand,
        TYPE as type,
        SIZE as size,
        CONTAINER as container,
        RETAILPRICE as retail_price,
        COMMENT as comment
    from source

)

select * from renamed