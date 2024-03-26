-- Make a nice analyzable model for customers!

-- customers_mart.sql

with

customers as (

    select * from {{ ref('stg_tpcds_customer') }}

),

customers_enriched as (

    select * from {{ ref('int_customers_enriched') }}

),

customers_orders_analyzed as (

    select * from {{ ref('int_customers_orders_analyzed') }}

),

customers_ordering_habits as (

    select * from {{ ref('int_customers_ordering_habits') }}

),

final as (

    select
        customers.customer_sk as customer_key,
        customers.customer_id as customer_id,
        customers.first_name as first_name,
        customers.last_name as last_name,
        customers.email_address as email,
        customers.preferred_customer_flag as preferred_customer,
        customers.birth_country as country_of_birth,
        customers.login as login_status,
        customers.current_cdemo_sk as demo_sk,
        customers.current_hdemo_sk as home_demo_sk,
        customers.current_addr_sk as current_address_sk,
        customers.first_shipto_date_sk as first_shipment_date_sk,
        customers.first_sales_date_sk as first_sales_date_sk,
        customers.birth_day as birth_day,
        customers.birth_month as birth_month,
        customers.birth_year as birth_year,
        customers.salutation as salutation,
        customers_enriched.customer_comment as customer_comment,
        customers_enriched.region_id as region_id,
        customers_enriched.market_segment as market_segment,
        customers_ordering_habits.total_orders as total_orders_placed,
        customers_ordering_habits.total_lineitems as total_line_items,
        customers_ordering_habits.total_quantity_ordered as total_quantity,
        customers_ordering_habits.total_order_value as total_spent,
        customers_ordering_habits.average_item_value_per_order as avg_order_value,
        customers_ordering_habits.ordering_frequency as ordering_frequency,
        customers_ordering_habits.order_value_bracket as spend_bracket,
        customers_orders_analyzed.total_lineitems as total_lineitems_analyzed,
        customers_orders_analyzed.total_quantity_ordered as total_quantity_analyzed,
        customers_orders_analyzed.total_order_value as total_order_value_analyzed,
        customers_orders_analyzed.avg_item_value as avg_item_value

    from customers

    left join customers_enriched on customers.customer_id = customers_enriched.customer_id
    left join customers_orders_analyzed on customers.customer_id = customers_orders_analyzed.customer_id
    left join customers_ordering_habits on customers.customer_id = customers_ordering_habits.customer_id
)

select * from final
