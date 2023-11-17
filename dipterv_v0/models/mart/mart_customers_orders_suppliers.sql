with customer_details as (

    select * from {{ ref('int_customers_enriched') }}

),

orders_enriched as (

    select * from {{ ref('int_orders_aggregated') }}

),

suppliers_details as (

    select * from {{ ref('int_suppliers_aggregated') }}

),

customers_orders_joined as (

    select
        cust.customer_id,
        cust.customer_name,
        ord.order_id,
        ord.order_status,
        ord.total_price,
        ord.order_date,
        ord.order_priority,
        ord.total_extended_price,
        ord.total_discount_price,
        ord.total_tax_price,
        ord.earliest_ship_date,
        ord.total_line_items
    from customer_details cust
    join orders_enriched ord 
        on cust.customer_id = ord.customer_id
),

customers_orders_suppliers_joined as (

    select
        coj.*,
        sup.supplier_id,
        sup.supplier_name,
        sup.account_balance as supplier_account_balance,
        sup.nation_name as supplier_nation_name
    from customers_orders_joined coj
    join suppliers_details sup
        on coj.customer_id = sup.supplier_id  -- Assuming relationship via customer_id for example; adjust if needed.
)

select * from customers_orders_suppliers_joined