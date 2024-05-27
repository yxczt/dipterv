with avg_revenue_per_customer_order as (
    select * from {{ ref('int_avg_revenue_per_customer_order') }}
),
lineitem_revenue as (
    select * from {{ ref('int_lineitem_revenue') }}
),
ordering_habits_per_nation as (
    select * from {{ ref('int_ordering_habits_per_nation') }}
),
combined_order_revenue as (
    select
        avg_revenue_per_customer_order.customer_sk,
        avg_revenue_per_customer_order.avg_revenue_per_order,
        lineitem_revenue.city,
        lineitem_revenue.state,
        lineitem_revenue.country,
        lineitem_revenue.max_revenue,
        ordering_habits_per_nation.nation,
        ordering_habits_per_nation.year,
        ordering_habits_per_nation.month,
        ordering_habits_per_nation.day,
        ordering_habits_per_nation.i_category,
        ordering_habits_per_nation.i_class,
        ordering_habits_per_nation.i_brand,
        ordering_habits_per_nation.total_quantity,
        ordering_habits_per_nation.total_net_paid,
        ordering_habits_per_nation.total_net_paid_inc_tax,
        ordering_habits_per_nation.total_net_paid_inc_ship,
        ordering_habits_per_nation.total_net_paid_inc_ship_tax
    from avg_revenue_per_customer_order
    join lineitem_revenue on avg_revenue_per_customer_order.customer_sk = lineitem_revenue.customer_sk
    join ordering_habits_per_nation on avg_revenue_per_customer_order.customer_sk = ordering_habits_per_nation.customer_sk
)
select * from combined_order_revenue