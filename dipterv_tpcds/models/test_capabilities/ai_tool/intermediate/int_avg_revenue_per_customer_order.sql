--average revenue per customer order
--time to develop code: 1 minute 27.08 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

--average revenue per customer order

with customer_orders as (
    select
        ws_bill_customer_sk as customer_sk,
        ws_order_number,
        sum(ws_net_paid) as total_order_revenue
    from {{ ref('stg_web_sales') }}
    group by ws_bill_customer_sk, ws_order_number
)

select
    customer_sk,
    avg(total_order_revenue) as avg_revenue_per_order
from customer_orders
group by customer_sk