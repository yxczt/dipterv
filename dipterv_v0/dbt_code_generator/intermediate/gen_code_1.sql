with customer_orders as (
    select
        a.customer_id,
        a.customer_name,
        count(b.order_id) as total_orders,
        a.total_revenue
    from {{ ref('int_revenue_per_customer') }} a
    join {{ ref('int_customers_orders_analyzed') }} b on a.customer_id = b.customer_id
    group by 1,2,3
)
select
    customer_id,
    customer_name,
    total_revenue / total_orders as avg_revenue_per_order
from customer_orders