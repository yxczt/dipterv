-- stg_tpch_part.sql

with source as (
    select
        PARTKEY as part_id,
        NAME as part_name,
        MFGR as manufacturer,
        BRAND as brand,
        TYPE as part_type,
        SIZE as size,
        CONTAINER as container,
        RETAILPRICE as retail_price,
        COMMENT as part_comment
    from {{ source('tpch', 'tpch_part') }}
)

select * from source
