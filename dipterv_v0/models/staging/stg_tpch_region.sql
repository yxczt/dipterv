-- stg_tpch_region.sql

with source as (
    select
        REGIONKEY as region_id,
        NAME as region_name,
        COMMENT as region_comment
    from {{ source('tpch', 'tpch_region') }}
)

select * from source
