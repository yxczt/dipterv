-- the avg revenue per customer in int_avg_revenue_per_customer_order equal or less than the max revenue int_lineitem_revenue
--time to develop code: 1 minute 57.49 seconds
--score: 1 * 1 + 2 * 2 + 0 * 10 = 5

-- the avg revenue per customer in int_avg_revenue_per_customer_order equal or less than the max revenue int_lineitem_revenue

select
    a.customer_sk,
    a.avg_revenue_per_order as avg_revenue_per_customer_order,
    b.max_revenue as max_revenue_per_lineitem
from {{ ref('int_avg_revenue_per_customer_order') }} a
inner join {{ ref('int_lineitem_revenue') }} b
on a.customer_sk = b.customer_sk
where a.avg_revenue_per_order <= b.max_revenue