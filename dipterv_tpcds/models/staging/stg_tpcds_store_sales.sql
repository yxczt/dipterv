with source as (

    select * from {{ source('tpcds','store_sales') }}

),

renamed as (

    select
        -- ids
        ss_sold_date_sk as sold_date_sk,
        ss_sold_time_sk as sold_time_sk,
        ss_item_sk as item_sk,
        ss_customer_sk as customer_sk,
        ss_cdemo_sk as cdemo_sk,
        ss_hdemo_sk as hdemo_sk,
        ss_addr_sk as addr_sk,
        ss_store_sk as store_sk,
        ss_promo_sk as promo_sk,
        ss_ticket_number as ticket_number,

        -- numerics
        ss_quantity as quantity,
        ss_wholesale_cost as wholesale_cost_cents,
        ss_list_price as list_price_cents,
        ss_sales_price as sales_price_cents,
        ss_ext_discount_amt as ext_discount_amt_cents,
        ss_ext_sales_price as ext_sales_price_cents,
        ss_ext_wholesale_cost as ext_wholesale_cost_cents,
        ss_ext_list_price as ext_list_price_cents,
        ss_ext_tax as ext_tax_cents,
        ss_coupon_amt as coupon_amt_cents,
        ss_net_paid as net_paid_cents,
        ss_net_paid_inc_tax as net_paid_inc_tax_cents,
        ss_net_profit as net_profit_cents

    from source

)

select * from renamed