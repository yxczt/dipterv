-- Make a connection between customers and orders and aggregate on the customer level every data that is possible!

with

customers as (

  select * from {{ ref('stg_tpch_customer') }}

),

orders as (

  select * from {{ ref('stg_tpch_orders') }}

),

customer_orders as (

  select 
    customers.customer_id,
    customers.customer_name,
    customers.account_balance,
    customers.market_segment,
    count(orders.order_id) as total_orders,
    sum(orders.total_price) as total_spent,
    min(orders.order_date) as first_order_date,
    max(orders.order_date) as latest_order_date
  from customers
  left join orders on customers.customer_id = orders.customer_id
  group by 1, 2, 3, 4
)

select * from customer_orders