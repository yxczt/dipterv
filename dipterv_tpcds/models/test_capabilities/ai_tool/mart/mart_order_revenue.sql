-- order revenue for analytical purposes by various dimensions
--time to develop code: 2 minute 08.75 seconds
--score: 0 * 1 + 2 * 2 + 0 * 10 = 4

-- order revenue for analytical purposes by various dimensions

with lineitem_revenue as (
    select * from {{ ref('int_lineitem_revenue') }}
),
ordering_habits_per_nation as (
    select * from {{ ref('int_ordering_habits_per_nation') }}
),
combined_order_revenue as (
    select
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
    from lineitem_revenue
    join ordering_habits_per_nation on lineitem_revenue.country = ordering_habits_per_nation.nation
)
select * from combined_order_revenue