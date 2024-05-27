-- ordering habits by nation
--time to develop code: 41.53 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

with customer_ordering_habits as (

   select * from {{ ref('int_customers_ordering_habits') }}

),

customers_enriched as (

   select * from {{ ref('int_customers_enriched') }}

),

lineitems_aggregated_by_nation as (

   select * from {{ ref('int_lineitems_aggregated_by_nation') }}

),

customer_nation_join as (

   select
      coh.customer_id,
      coh.customer_name,
      coh.first_order_date,
      coh.latest_order_date,
      coh.total_orders,
      coh.total_lineitems,
      coh.total_quantity_ordered,
      coh.total_order_value,
      coh.average_item_value_per_order,
      coh.ordering_frequency,
      coh.order_value_bracket,
      ce.nation_name
   from customer_ordering_habits coh
   join customers_enriched ce on coh.customer_id = ce.customer_id

),

ordering_habits_by_nation as (

   select
      cnj.nation_name,
      avg(cnj.total_orders) as avg_total_orders,
      avg(cnj.total_quantity_ordered) as avg_total_quantity_ordered,
      avg(cnj.total_order_value) as avg_total_order_value,
      avg(cnj.average_item_value_per_order) as avg_item_value_per_order,
      count(distinct cnj.customer_id) as number_of_customers
   from customer_nation_join cnj
   group by cnj.nation_name

),

final as (

   select
      ohbn.nation_name,
      ohbn.avg_total_orders,
      ohbn.avg_total_quantity_ordered,
      ohbn.avg_total_order_value,
      ohbn.avg_item_value_per_order,
      ohbn.number_of_customers,
      labn.total_quantity as total_quantity_by_nation,
      labn.avg_quantity as avg_quantity_by_nation,
      labn.total_orders as total_orders_by_nation
   from ordering_habits_by_nation ohbn
   left join lineitems_aggregated_by_nation labn on ohbn.nation_name = labn.nation_name

)

select * from final