-- lineitems bought by customer
--time to develop code: 30.38 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

with customers as (

   select * from {{ ref('stg_tpch_customer') }}

),

orders as (

   select * from {{ ref('stg_tpch_orders') }}

),

lineitems as (

   select * from {{ ref('stg_tpch_lineitem') }}

),

customer_orders as (

   select
      customers.customer_id,
      customers.customer_name,
      orders.order_id
   from customers
   join orders on customers.customer_id = orders.customer_id
),

customer_lineitems as (

   select
      customer_orders.customer_id,
      customer_orders.customer_name,
      customer_orders.order_id,
      lineitems.part_id,
      lineitems.quantity,
      lineitems.extended_price,
      lineitems.discount,
      lineitems.tax
   from customer_orders
   join lineitems on customer_orders.order_id = lineitems.order_id
)

select * from customer_lineitems