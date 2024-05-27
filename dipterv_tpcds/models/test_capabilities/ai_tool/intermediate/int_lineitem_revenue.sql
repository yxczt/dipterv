--max revenue per customer by region
--time to develop code: 1 minute 51.54 seconds
--score: 2 * 1 + 1 * 2 + 0 * 10 = 4

--max revenue per customer by region

with customer_sales as (

   select
      c.customer_sk,
      c.customer_id,
      ca.city,
      ca.state,
      ca.country,
      coalesce(sum(ws.ws_net_paid), 0) + coalesce(sum(ss.net_paid_cents), 0) as total_revenue
   from {{ ref('stg_customer') }} c
   left join {{ ref('stg_tpcds_customer_address') }} ca on c.current_addr_sk = ca.address_sk
   left join {{ ref('stg_web_sales') }} ws on c.customer_sk = ws.ws_bill_customer_sk
   left join {{ ref('stg_tpcds_store_sales') }} ss on c.customer_sk = ss.customer_sk
   group by 1, 2, 3, 4, 5
),

max_revenue_by_region as (

   select
      city,
      state,
      country,
      max(total_revenue) as max_revenue
   from customer_sales
   group by 1, 2, 3
)

select * from max_revenue_by_region