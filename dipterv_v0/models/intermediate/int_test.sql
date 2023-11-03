with source as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        o.total_price,
        o.order_date,
        o.order_priority,
        o.ship_priority,
        o.clerk,
        o.order_comment,
        n.nation_id,
        n.nation_name,
        n.region_id,
        r.region_name,
        r.region_comment
    from {{ ref('stg_tpch_orders') }} as o
    left join {{ ref('stg_tpch_customer') }} as c on o.customer_id = c.customer_id
    left join {{ ref('stg_tpch_nation') }} as n on c.nation_id = n.nation_id
    left join {{ ref('stg_tpch_region') }} as r on n.region_id = r.region_id
)

select * from source