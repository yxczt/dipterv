-- lineitems bought by customer
--time to develop code: 1 minute 22.77 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 0

-- lineitems bought by customer

with customer_sales as (

  select 
    ws.ws_order_number,
    ws.ws_item_sk,
    ws.ws_sold_date_sk,
    ws.ws_bill_customer_sk,
    ws.ws_quantity,
    ws.ws_wholesale_cost,
    ws.ws_sales_price,
    ws.ws_bill_customer_sk as customer_sk
  from {{ ref('stg_web_sales') }} ws

),

item_details as (

  select
    i.item_sk,
    i.item_id,
    i.item_desc,
    i.current_price,
    i.wholesale_cost,
    i.brand,
    i.class,
    i.category
  from {{ ref('stg_item') }} i

),

sales_date as (

  select
    d.date_sk,
    d.date
  from {{ ref('stg_tpcds_date_dim') }} d

),

customer_info as (

  select
    c.customer_sk,
    c.customer_id
  from {{ ref('stg_customer') }} c

),

sales_with_item_details as (

  select
    cs.ws_order_number,
    cs.ws_item_sk,
    cs.ws_sold_date_sk,
    cs.ws_bill_customer_sk,
    cs.ws_quantity,
    cs.ws_wholesale_cost,
    cs.ws_sales_price,
    id.item_id,
    id.item_desc,
    id.current_price,
    id.wholesale_cost,
    id.brand,
    id.class,
    id.category
  from customer_sales cs
  join item_details id on cs.ws_item_sk = id.item_sk

),

sales_with_date as (

  select
    swid.*,
    sd.date
  from sales_with_item_details swid
  join sales_date sd on swid.ws_sold_date_sk = sd.date_sk

)

select
  ci.customer_id,
  swd.ws_order_number,
  swd.item_id,
  swd.item_desc,
  swd.brand,
  swd.class,
  swd.category,
  swd.date,
  swd.ws_quantity,
  swd.ws_wholesale_cost,
  swd.ws_sales_price
from sales_with_date swd
join customer_info ci on swd.ws_bill_customer_sk = ci.customer_sk