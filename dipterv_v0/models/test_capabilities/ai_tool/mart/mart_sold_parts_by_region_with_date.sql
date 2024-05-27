-- sold parts by region with date with various dimensions
-- time to develop code: 1 minute 17.53 seconds
-- score: 3 * 1 + 2 * 2 + 0 * 10 = 5

with parts_and_orders as (

   select * from {{ ref('int_parts_and_orders_enriched') }}

),

regions_and_nations as (

   select * from {{ ref('int_regions_and_nations') }}

),

sold_parts_by_region as (

   select
      po.order_id,
      po.customer_id,
      po.order_status,
      po.total_price,
      po.order_date,
      po.order_priority,
      po.part_id,
      po.part_name,
      po.manufacturer,
      po.brand,
      po.size,
      po.container,
      po.quantity,
      po.extended_price,
      po.discount,
      po.total_order_value,
      po.avg_item_value,
      po.earliest_order_date,
      po.latest_order_date,
      po.unique_parts_ordered,
      po.total_quantity_ordered,
      po.avg_price_per_part,
      po.min_price_per_part,
      po.max_price_per_part,
      rn.nation_id,
      rn.nation_name,
      rn.region_id,
      rn.region_name,
      rn.region_comment
   from parts_and_orders po
   join regions_and_nations rn on po.customer_id = rn.nation_id

)

select * from sold_parts_by_region