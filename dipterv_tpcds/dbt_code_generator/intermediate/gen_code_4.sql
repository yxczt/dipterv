with customer_sales as (

   select
      c.customer_sk,
      c.customer_id,
      ca.city,
      ca.state,
      ca.country,
      coalesce(sum(ws.ws_net_paid), 0) + coalesce(sum(ss.ss_net_paid), 0) as total_revenue
   from {{ ref('stg_customer') }} c
   left join {{ ref('stg_customer_address') }} ca on c.customer_sk = ca.customer_sk
   left join {{ ref('stg_web_sales') }} ws on c.customer_sk = ws.ws_bill_customer_sk
   left join {{ ref('stg_store_sales') }} ss on c.customer_sk = ss.ss_customer_sk
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