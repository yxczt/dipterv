-- Make a nice analyzable model for customers from only models that use tpch data!


-- customer_insights.sql

with

customers as  (

    select * from {{ ref('stg_tpch_customer') }}

),

orders_aggregated as (

    select * from {{ ref('int_orders_aggregated') }}

),

revenue_per_customer as (

    select * from {{ ref('int_revenue_per_customer') }}

),

customers_orders_analyzed as (

    select * from {{ ref('int_customers_orders_analyzed') }}

),

customers_ordering_habits as (

    select * from {{ ref('int_customers_ordering_habits') }}

),

customers_and_orders_joined as (

    select
        customers.customer_id,
        customers.customer_name,
        customers.customer_address,
        customers.nation_id,
        customers.customer_phone,
        customers.account_balance,
        customers.market_segment,
        customers.customer_comment,
        orders_aggregated.total_price as total_orders_value,
        orders_aggregated.order_date as last_order_date,
        revenue_per_customer.total_revenue,
        customers_orders_analyzed.total_lineitems,
        customers_orders_analyzed.total_quantity_ordered,
        customers_orders_analyzed.total_order_value,
        customers_orders_analyzed.avg_item_value as average_item_value,
        customers_ordering_habits.first_order_date,
        customers_ordering_habits.latest_order_date,
        customers_ordering_habits.total_orders,
        customers_ordering_habits.total_lineitems as total_lineitems_per_customer,
        customers_ordering_habits.total_quantity_ordered as total_quantity_ordered_per_customer,
        customers_ordering_habits.total_order_value as total_order_value_per_customer,
        customers_ordering_habits.average_item_value_per_order,
        customers_ordering_habits.ordering_frequency,
        customers_ordering_habits.order_value_bracket

    from customers

    left join orders_aggregated on customers.customer_id = orders_aggregated.customer_id
    left join revenue_per_customer on customers.customer_id = revenue_per_customer.customer_id
    left join customers_orders_analyzed on customers.customer_id = customers_orders_analyzed.customer_id
    left join customers_ordering_habits on customers.customer_id = customers_ordering_habits.customer_id

)

select * from customers_and_orders_joined