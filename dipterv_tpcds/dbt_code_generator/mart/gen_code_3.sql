with avg_revenue_per_customer_order as (

    select * from {{ ref('int_avg_revenue_per_customer_order_copilot') }}

), lineitem_revenue as (

    select * from {{ ref('int_lineitem_revenue_copilot') }}

), ordering_habits_per_nation as (

    select * from {{ ref('int_ordering_habits_per_nation_copilot') }}

), item_sold_by_month as (

    select * from {{ ref('int_item_sold_by_month_copilot') }}

)

select
    avg_revenue_per_customer_order.customer_id,
    avg_revenue_per_customer_order.avg_revenue_per_customer_order,
    lineitem_revenue.region,
    lineitem_revenue.max_revenue_per_customer,
    ordering_habits_per_nation.nation,
    ordering_habits_per_nation.total_orders,
    ordering_habits_per_nation.total_revenue,
    item_sold_by_month.month,
    item_sold_by_month.items_sold

from avg_revenue_per_customer_order

left join lineitem_revenue on avg_revenue_per_customer_order.customer_id = lineitem_revenue.region
left join ordering_habits_per_nation on lineitem_revenue.region = ordering_habits_per_nation.nation
left join item_sold_by_month on ordering_habits_per_nation.nation = item_sold_by_month.month