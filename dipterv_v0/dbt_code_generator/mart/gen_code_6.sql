with orders_enriched as (

    select * from {{ ref('int_orders_enriched') }}

), suppliers_enriched as (

    select * from {{ ref('int_suppliers_enriched') }}

), regions_and_nations as (

    select * from {{ ref('int_regions_and_nations') }}

), suppliers_and_regions_joined as (

    select
        suppliers_enriched.supplier_id,
        suppliers_enriched.supplier_name,
        suppliers_enriched.supplier_address,
        suppliers_enriched.nation_id,
        suppliers_enriched.supplier_phone,
        suppliers_enriched.account_balance,
        suppliers_enriched.supplier_comment,
        regions_and_nations.region_name,
        regions_and_nations.region_id
    from suppliers_enriched
    join regions_and_nations on suppliers_enriched.nation_id = regions_and_nations.nation_id

), orders_suppliers_regions_joined as (

    select
        orders_enriched.order_id,
        orders_enriched.customer_id,
        orders_enriched.order_status,
        orders_enriched.total_price,
        orders_enriched.order_date,
        orders_enriched.order_priority,
        orders_enriched.ship_priority,
        orders_enriched.clerk,
        orders_enriched.order_comment,
        orders_enriched.customer_name,
        orders_enriched.nation_name,
        suppliers_and_regions_joined.region_id,
        suppliers_and_regions_joined.supplier_id,
        suppliers_and_regions_joined.supplier_name,
        suppliers_and_regions_joined.supplier_address,
        suppliers_and_regions_joined.nation_id,
        suppliers_and_regions_joined.supplier_phone,
        suppliers_and_regions_joined.account_balance,
        suppliers_and_regions_joined.supplier_comment,
        suppliers_and_regions_joined.region_name
    from orders_enriched
    left join suppliers_and_regions_joined on orders_enriched.supplier_id = suppliers_and_regions_joined.supplier_id

)

select * from orders_suppliers_regions_joined