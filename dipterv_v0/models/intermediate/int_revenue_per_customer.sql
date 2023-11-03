-- int_revenue_per_customer.sql

with customer_info as (
    select
        customer_id,
        customer_name,
        customer_address,
        nation_id,
        customer_phone,
        account_balance,
        market_segment,
        customer_comment
    from {{ ref('stg_tpch_customer') }}
),

nation_info as (
    select
        nation_id,
        nation_name,
        region_id,
        nation_comment
    from {{ ref('stg_tpch_nation') }}
),

region_info as (
    select
        region_id,
        region_name,
        region_comment
    from {{ ref('stg_tpch_region') }}
),

order_info as (
    select
        order_id,
        customer_id,
        total_price
    from {{ ref('stg_tpch_orders') }}
),

customer_revenue as (
    select
        ci.customer_id,
        ci.customer_name,
        ci.customer_address,
        ci.nation_id,
        ci.customer_phone,
        ci.account_balance,
        ci.market_segment,
        ci.customer_comment,
        ni.nation_name,
        ni.region_id,
        ri.region_name,
        sum(oi.total_price) as total_revenue
    from customer_info ci
    left join order_info oi on ci.customer_id = oi.customer_id
    left join nation_info ni on ci.nation_id = ni.nation_id
    left join region_info ri on ni.region_id = ri.region_id
    group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
)

select * from customer_revenue
