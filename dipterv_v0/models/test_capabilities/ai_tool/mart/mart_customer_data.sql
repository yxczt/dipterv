-- customer data by nations and regions with various dimensions
--time to develop code: 32.82 seconds
--score: 0 * 1 + 0 * 2 + 1 * 10 = 10

with customers as (

    select * from {{ ref('stg_tpch_customer') }}

),

nations_and_regions as (

    select * from {{ ref('int_regions_and_nations') }}

),

customers_enriched as (

    select
        customers.customer_id,
        customers.customer_name,
        customers.customer_address,
        customers.nation_id,
        customers.customer_phone,
        customers.account_balance,
        customers.market_segment,
        customers.customer_comment,
        nations_and_regions.nation_name,
        nations_and_regions.region_id,
        nations_and_regions.region_name

    from customers

    join nations_and_regions on customers.nation_id = nations_and_regions.nation_id

)

select * from customers_enriched