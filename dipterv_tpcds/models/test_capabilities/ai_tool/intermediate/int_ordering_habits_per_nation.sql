-- ordering habits by nation
--time to develop code: 1 minute 58.80 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- ordering habits by nation

with customer_nation as (
    select
        c_customer_sk,
        c_birth_country
    from {{ ref('stg_customer_copilot') }}
),
web_sales_enriched as (
    select
        ws_order_number,
        ws_sold_date_sk,
        ws_item_sk,
        ws_bill_customer_sk,
        ws_quantity,
        ws_net_paid,
        ws_net_paid_inc_tax,
        ws_net_paid_inc_ship,
        ws_net_paid_inc_ship_tax
    from {{ ref('stg_web_sales_copilot') }}
),
item_details as (
    select
        i_item_sk,
        i_category,
        i_class,
        i_brand
    from {{ ref('stg_item_copilot') }}
),
date_details as (
    select
        date_sk,
        year,
        moy,
        dom
    from {{ ref('stg_tpcds_date_dim') }}
),
sales_by_nation as (
    select
        cn.c_birth_country as nation,
        dd.year as year,
        dd.moy as month,
        dd.dom as day,
        id.i_category,
        id.i_class,
        id.i_brand,
        sum(wse.ws_quantity) as total_quantity,
        sum(wse.ws_net_paid) as total_net_paid,
        sum(wse.ws_net_paid_inc_tax) as total_net_paid_inc_tax,
        sum(wse.ws_net_paid_inc_ship) as total_net_paid_inc_ship,
        sum(wse.ws_net_paid_inc_ship_tax) as total_net_paid_inc_ship_tax
    from web_sales_enriched wse
    join customer_nation cn on wse.ws_bill_customer_sk = cn.c_customer_sk
    join item_details id on wse.ws_item_sk = id.i_item_sk
    join date_details dd on wse.ws_sold_date_sk = dd.date_sk
    group by cn.c_birth_country, dd.year, dd.moy, dd.dom, id.i_category, id.i_class, id.i_brand
)

select * from sales_by_nation