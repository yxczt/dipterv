with ordering_habits_per_nation as (

    select * from {{ ref('int_ordering_habits_per_nation') }}

),

lineitem_revenue as (

    select * from {{ ref('int_lineitem_revenue') }}

),

customer_data_by_nations_and_regions as (

    select
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
        ordering_habits_per_nation.total_net_paid_inc_ship_tax,
        lineitem_revenue.city,
        lineitem_revenue.state,
        lineitem_revenue.country,
        lineitem_revenue.max_revenue
    from ordering_habits_per_nation
    left join lineitem_revenue on ordering_habits_per_nation.nation = lineitem_revenue.city

)

select * from customer_data_by_nations_and_regions