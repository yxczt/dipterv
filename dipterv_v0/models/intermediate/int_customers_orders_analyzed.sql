-- Develop a model, that is used to analyze a customers ordering habits!

with

customers as (

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
      orders.order_id,
      orders.order_date,
      orders.order_status
   from customers
   join orders on customers.customer_id = orders.customer_id

),

order_lineitems as (

   select
      order_id,
      count(*) as total_lineitems,
      sum(quantity) as total_quantity_ordered,
      sum(extended_price) as total_order_value,
      avg(extended_price) as avg_item_value
   from lineitems
   group by 1

),

orders_analyzed as (

   select
      customer_orders.customer_id,
      customer_orders.customer_name,
      customer_orders.order_id,
      customer_orders.order_date,
      customer_orders.order_status,
      order_lineitems.total_lineitems,
      order_lineitems.total_quantity_ordered,
      order_lineitems.total_order_value,
      order_lineitems.avg_item_value
   from customer_orders
   join order_lineitems on customer_orders.order_id = order_lineitems.order_id

)

select * from orders_analyzed
