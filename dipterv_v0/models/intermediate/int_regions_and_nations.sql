-- int_regions_and_nations.sql

with source as (
  select 
    n.nation_id,
    n.nation_name,
    n.region_id,
    r.region_name,
    r.region_comment
  from {{ ref('stg_tpch_nation') }} n
  inner join {{ ref('stg_tpch_region')}} r on n.region_id = r.region_id
)

select * from source