-- max revenue in int_lineitem_revenue is greater than or equal to total revenue in int_orders_enriched
--time to develop code: 1 minute 29.10 seconds
--score: 0 * 1 + 3 * 2 + 0 * 10 = 6

select
    ilr.region_id,
    ilr.region_name,
    ilr.max_revenue_in_region,
    ioe.total_price as total_revenue,
    ioe.order_id,
    ioe.customer_id,
    ioe.order_status,
    ioe.order_date,
    ioe.order_priority,
    ioe.ship_priority,
    ioe.clerk,
    ioe.order_comment,
    ioe.customer_name,
    ioe.nation_name,
    ioe.region_id as enriched_region_id
from {{ ref('int_lineitem_revenue') }} ilr
inner join {{ ref('int_orders_enriched') }} ioe
on ilr.region_id = ioe.region_id
where ilr.max_revenue_in_region >= ioe.total_price