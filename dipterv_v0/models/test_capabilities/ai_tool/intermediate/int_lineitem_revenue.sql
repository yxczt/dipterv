--max revenue per customer by region
--time to develop code: 38.88 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

with revenue_per_customer as (

   select 
      region_id,
      region_name,
      customer_id,
      max(total_revenue) as max_revenue
   from {{ ref('int_revenue_per_customer') }}
   group by region_id, region_name, customer_id

), max_revenue_per_region as (

   select
      region_id,
      region_name,
      max(max_revenue) as max_revenue_in_region
   from revenue_per_customer
   group by region_id, region_name

)

select * from max_revenue_per_region