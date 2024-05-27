with stg_tpch_part as (

  select * from {{ ref('stg_tpch_part') }}

)

select * from stg_tpch_part