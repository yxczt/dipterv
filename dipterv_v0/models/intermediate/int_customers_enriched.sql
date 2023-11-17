with customers as (
    select * from {{ ref('stg_tpch_customer') }}
),

nations as (
    select * from {{ ref('stg_tpch_nation') }}
),

customers_enriched as (
    select
        c.customer_id,
        c.customer_name,
        c.customer_address,
        c.nation_id,
        c.customer_phone,
        c.account_balance,
        c.market_segment,
        c.customer_comment,
        n.nation_name,
        n.region_id
    from customers c
    left join nations n on c.nation_id = n.nation_id
)

select * from customers_enriched