{# Make a meaningful connection between lineitems and nations and aggregate on the nation level! #} 

{%- set aggregates = ['sum(quantity) as total_quantity', 'avg(quantity) as avg_quantity', 'count(order_id) as total_orders'] -%}

with lineitems as (

   select * from {{ ref('stg_tpch_lineitem') }}

),

orders as (

   select * from {{ ref('stg_tpch_orders') }}

),

customers as (

   select * from {{ ref('stg_tpch_customer') }}

),

nations as (

   select * from {{ ref('stg_tpch_nation') }}

),

lineitems_enriched as (

   select
      l.order_id,
      l.part_id,
      l.quantity,
      o.customer_id
   from lineitems l
   join orders o on l.order_id = o.order_id

),

customers_enriched as (

   select
      c.customer_id,
      c.nation_id
   from customers c

),

lineitems_customers_nations as (

   select
      len.order_id,
      len.part_id,
      len.quantity,
      cen.nation_id
   from lineitems_enriched len
   join customers_enriched cen on len.customer_id = cen.customer_id

),

aggregated_by_nation as (

   select
      n.nation_name,
      {% for aggregate in aggregates %}
         {{ aggregate }}{% if not loop.last %},{% endif %}
      {% endfor %}
   from lineitems_customers_nations lcn
   join nations n on lcn.nation_id = n.nation_id
   group by n.nation_name

)

select * from aggregated_by_nation