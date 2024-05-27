-- if the avg revenue per order in int_avg_revenue_per_customer_order is not 0, then the total orders in int_customers_orders_analyzed should be greater than 0
--time to develop code: 1 minute 21.87 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

select
    a.customer_id,
    a.customer_name,
    a.avg_revenue_per_order,
    b.total_orders
from {{ ref('int_avg_revenue_per_customer_order') }} a
left join {{ ref('int_customers_orders_analyzed') }} b
on a.customer_id = b.customer_id
where a.avg_revenue_per_order != 0 and (b.total_orders is null or b.total_orders <= 0)