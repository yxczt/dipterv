with customer_orders as (
  select
    ws_bill_customer_sk as customer_sk,
    sum(ws_net_paid) as total_revenue_per_customer,
    count(distinct ws_order_number) as total_orders
  from {{ ref('stg_web_sales') }}
  group by ws_bill_customer_sk
)

select
  co.customer_sk,
  c.customer_id,
  co.total_revenue_per_customer,
  co.total_orders,
  (co.total_revenue_per_customer / nullif(co.total_orders, 0)) as average_revenue_per_order
from customer_orders co
join {{ ref('stg_customer') }} c on co.customer_sk = c.customer_sk