with parts_and_orders as (

    select * from {{ ref('int_parts_and_orders_enriched') }}

), orders_aggregated as (

    select * from {{ ref('int_orders_aggregated') }}

), regions_and_nations as (

    select * from {{ ref('int_regions_and_nations') }}

), suppliers_aggregated as (

    select * from {{ ref('int_suppliers_aggregated') }}

), suppliers_enriched as (

    select * from {{ ref('int_suppliers_enriched') }}

), combined as (

    select
        parts_and_orders.order_date,
        parts_and_orders.part_id,
        parts_and_orders.part_name,
        parts_and_orders.manufacturer,
        parts_and_orders.brand,
        parts_and_orders.size,
        parts_and_orders.container,
        parts_and_orders.quantity,
        parts_and_orders.extended_price,
        parts_and_orders.discount,
        parts_and_orders.total_order_value,
        parts_and_orders.avg_item_value,
        coalesce(suppliers_aggregated.region_name, suppliers_enriched.region_name) as region_name,
        coalesce(suppliers_aggregated.nation_name, suppliers_enriched.nation_name) as nation_name,
        coalesce(suppliers_enriched.region_id, regions_and_nations.region_id) as region_id
    from parts_and_orders
    join orders_aggregated on parts_and_orders.order_id = orders_aggregated.order_id
    left join suppliers_aggregated on parts_and_orders.supplier_id = suppliers_aggregated.supplier_id
    left join suppliers_enriched on parts_and_orders.supplier_id = suppliers_enriched.supplier_id
    left join regions_and_nations on suppliers_aggregated.nation_id = regions_and_nations.nation_id or suppliers_enriched.nation_id = regions_and_nations.nation_id

)

select * from combined