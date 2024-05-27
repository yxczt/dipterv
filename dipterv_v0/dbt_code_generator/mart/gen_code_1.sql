with customers as  (

    select * from {{ ref('stg_tpch_customer' )}}

),

nations as (

    select * from {{ ref('stg_tpch_nation') }}

),

regions as (

    select * from {{ ref('stg_tpch_region') }}

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
        nations.nation_name,
        regions.region_id,
        regions.region_name

    from customers

    join nations on customers.nation_id = nations.nation_id

    join regions on nations.region_id = regions.region_id

)

select * from customers_enriched