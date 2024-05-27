with orders as (

    select * from {{ ref('int_orders_enriched') }}

)

select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.total_price,
    orders.order_date,
    orders.order_priority,
    orders.ship_priority,
    orders.clerk,
    orders.order_comment,
    orders.customer_name,
    orders.nation_name,
    orders.region_id
from orders