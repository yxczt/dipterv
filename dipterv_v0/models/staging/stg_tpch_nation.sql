-- stg_tpch_nation.sql

with source as (
    select
        NATIONKEY as nation_id,
        NAME as nation_name,
        REGIONKEY as region_id,
        COMMENT as nation_comment
    from {{ source('tpch', 'tpch_nation') }}
)

select * from source
