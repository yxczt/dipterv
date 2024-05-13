--make a connection between tpch parts and tpch orders!

with orders as (

  select * from {{ ref('stg_tpch_orders') }}

),

parts as (

  select * from {{ ref('stg_tpch_part') }}

),

lineitems as (

  select * from {{ ref('stg_tpch_lineitem') }}

),

parts_joined as (

  select
    lineitems.order_id,
    parts.part_id,
    parts.part_name,
    parts.manufacturer,
    parts.brand,
    parts.size,
    parts.container,
    lineitems.quantity,
    lineitems.extended_price,
    lineitems.discount

  from lineitems

  join parts on lineitems.part_id = parts.part_id

),

orders_joined as (

  select
    orders.order_id,
    orders.customer_id,
    orders.order_status,
    orders.total_price,
    orders.order_date,
    orders.order_priority,
    parts_joined.part_id,
    parts_joined.part_name,
    parts_joined.manufacturer,
    parts_joined.brand,
    parts_joined.size,
    parts_joined.container,
    parts_joined.quantity,
    parts_joined.extended_price,
    parts_joined.discount

  from orders

  join parts_joined on orders.order_id = parts_joined.order_id

)

select * from orders_joined