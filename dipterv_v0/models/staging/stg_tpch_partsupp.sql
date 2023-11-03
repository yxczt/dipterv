-- stg_tpch_partsupp.sql

with source as (
    select
        PARTKEY as part_id,
        SUPPKEY as supplier_id,
        AVAILQTY as available_quantity,
        SUPPLYCOST as supply_cost,
        COMMENT as partsupp_comment
    from {{ source('tpch', 'tpch_partsupp') }}
)

select * from source
