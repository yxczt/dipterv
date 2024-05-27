with lineitem_revenue as (

    select * from {{ ref('int_lineitem_revenue') }}

),

lineitem_sold_per_customer as (

    select * from {{ ref('int_lineitem_sold_per_customer') }}

),

ordering_habits_per_nation as (

    select * from {{ ref('int_ordering_habits_per_nation') }}

),

sold_items_by_region_and_date as (

    select
        lineitem_revenue.region,
        ordering_habits_per_nation.nation,
        ordering_habits_per_nation.year,
        ordering_habits_per_nation.month,
        ordering_habits_per_nation.day,
        lineitem_sold_per_customer.customer_id,
        lineitem_sold_per_customer.ws_order_number,
        lineitem_sold_per_customer.item_id,
        lineitem_sold_per_customer.item_desc,
        lineitem_sold_per_customer.brand,
        lineitem_sold_per_customer.class,
        lineitem_sold_per_customer.category,
        lineitem_sold_per_customer.date,
        lineitem_sold_per_customer.ws_quantity,
        lineitem_sold_per_customer.ws_wholesale_cost,
        lineitem_sold_per_customer.ws_sales_price,
        ordering_habits_per_nation.i_category as nation_category,
        ordering_habits_per_nation.i_class as nation_class,
        ordering_habits_per_nation.i_brand as nation_brand,
        ordering_habits_per_nation.total_quantity,
        ordering_habits_per_nation.total_net_paid,
        ordering_habits_per_nation.total_net_paid_inc_tax,
        ordering_habits_per_nation.total_net_paid_inc_ship,
        ordering_habits_per_nation.total_net_paid_inc_ship_tax,
        lineitem_revenue.max_revenue

    from lineitem_revenue

    join lineitem_sold_per_customer on lineitem_revenue.region = lineitem_sold_per_customer.customer_id

    join ordering_habits_per_nation on lineitem_sold_per_customer.customer_id = ordering_habits_per_nation.nation

)

select * from sold_items_by_region_and_date