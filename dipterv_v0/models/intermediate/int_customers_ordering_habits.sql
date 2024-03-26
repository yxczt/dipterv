-- Develop a model, that is used to analyze a customers ordering habits!


with customer_orders as (

  select * from {{ ref('int_customers_orders_analyzed') }}

),

customer_order_summary as (

  select
    customer_id,
    customer_name,
    min(order_date) as first_order_date,
    max(order_date) as latest_order_date,
    count(distinct order_id) as total_orders,
    sum(total_lineitems) as total_lineitems,
    sum(total_quantity_ordered) as total_quantity_ordered,
    round(sum(total_order_value), 2) as total_order_value,
    round(avg(avg_item_value), 2) as average_item_value_per_order
  from customer_orders
  group by 1, 2

),

customer_ordering_frequency as (

  select
    customer_id,
    customer_name,
    case
      when total_orders = 1 then 'One-time'
      when total_orders between 2 and 5 then 'Infrequent'
      when total_orders between 6 and 15 then 'Regular'
      when total_orders > 15 then 'Frequent'
    end as ordering_frequency
  from customer_order_summary

),

customer_order_value_bracket as (

  select
    customer_id,
    customer_name,
    case
      when total_order_value < 10000 then 'Low-value'
      when total_order_value between 10000 and 50000 then 'Mid-value'
      when total_order_value > 50000 then 'High-value'
    end as order_value_bracket
  from customer_order_summary

)

select
  co.customer_id,
  co.customer_name,
  co.first_order_date,
  co.latest_order_date,
  co.total_orders,
  co.total_lineitems,
  co.total_quantity_ordered,
  co.total_order_value,
  co.average_item_value_per_order,
  cof.ordering_frequency,
  cov.order_value_bracket
from customer_order_summary co
left join customer_ordering_frequency cof on co.customer_id = cof.customer_id
left join customer_order_value_bracket cov on co.customer_id = cov.customer_id
