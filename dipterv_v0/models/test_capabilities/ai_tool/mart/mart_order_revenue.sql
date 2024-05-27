-- order revenue for analytical purposes by various dimensions
--time to develop code: 1 minute 13.55 seconds
--score: 0 * 1 + 0 * 2 + 1 * 10 = 10

with orders_enriched as (

    select * from {{ ref('int_orders_enriched') }}

), customers_enriched as (

    select * from {{ ref('int_customers_enriched') }}

), orders_and_customers_joined as (

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
        orders_enriched.region_id
    from orders_enriched
    left join customers_enriched on orders_enriched.customer_id = customers_enriched.customer_id

)

select * from orders_and_customers_joined
