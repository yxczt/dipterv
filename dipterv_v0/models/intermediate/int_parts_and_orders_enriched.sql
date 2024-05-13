--make a richer connection between tpch parts and tpch orders using int_parts_and_orders and various aggregations!

-- int_parts_and_orders_enriched.sql

with

parts_and_orders as (

   select * from {{ ref('int_parts_and_orders') }}

),

aggregated_orders as (

   select
      order_id,
      sum(total_price) as total_order_value,
      avg(total_price) as avg_item_value,
      min(order_date) as earliest_order_date,
      max(order_date) as latest_order_date,
      count(distinct part_id) as unique_parts_ordered
   from parts_and_orders
   group by 1

),

aggregated_parts as (

   select
      part_id,
      sum(quantity) as total_quantity_ordered,
      avg(extended_price) as avg_price_per_part,
      min(extended_price) as min_price_per_part,
      max(extended_price) as max_price_per_part
   from parts_and_orders
   group by 1

),

joined_data as (

   select
      pao.*,
      ao.total_order_value,
      ao.avg_item_value,
      ao.earliest_order_date,
      ao.latest_order_date,
      ao.unique_parts_ordered,
      ap.total_quantity_ordered,
      ap.avg_price_per_part,
      ap.min_price_per_part,
      ap.max_price_per_part
   from parts_and_orders pao
   left join aggregated_orders ao on pao.order_id = ao.order_id
   left join aggregated_parts ap on pao.part_id = ap.part_id

)

select * from joined_data