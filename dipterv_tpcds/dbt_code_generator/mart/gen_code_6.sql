with lineitem_sold_per_customer as (

    select * from {{ ref('int_lineitem_sold_per_customer_copilot') }}

),

lineitem_revenue as (

    select * from {{ ref('int_lineitem_revenue_copilot') }}

),

sold_items_by_region as (

    select
        lineitem_revenue.region,
        lineitem_sold_per_customer.customer_id,
        lineitem_sold_per_customer.lineitems_bought,
        lineitem_revenue.max_revenue_per_customer

    from lineitem_sold_per_customer

    join lineitem_revenue on lineitem_sold_per_customer.customer_id = lineitem_revenue.region

)

select * from sold_items_by_region