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