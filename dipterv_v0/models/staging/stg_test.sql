all tpcds models
```sql
-- stg_tpcds__call_center.sql

with source as (

    select * from {{ source('tpcds', 'call_center') }}

),

renamed as (

    select
        cc_call_center_sk as call_center_sk,
        cc_call_center_id as call_center_id,
        cc_rec_start_date as rec_start_date,
        cc_rec_end_date as rec_end_date,
        cc_closed_date_sk as closed_date_sk,
        cc_open_date_sk as open_date_sk,
        cc_name,
        cc_class,
        cc_employees,
        cc_sq_ft,
        cc_hours,
        cc_manager,
        cc_mkt_id as market_id,
        cc_mkt_class as market_class,
        cc_mkt_desc as market_desc,
        cc_market_manager,
        cc_division,
        cc_division_name,
        cc_company,
        cc_company_name,
        cc_street_number,
        cc_street_name,
        cc_street_type,
        cc_suite_number,
        cc_city,
        cc_county,
        cc_state,
        cc_zip,
        cc_country,
        cc_gmt_offset,
        cc_tax_percentage
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__catalog_page.sql

with source as (

    select * from {{ source('tpcds', 'catalog_page') }}

),

renamed as (

    select
        cp_catalog_page_sk as catalog_page_sk,
        cp_catalog_page_id as catalog_page_id,
        cp_start_date_sk as start_date_sk,
        cp_end_date_sk as end_date_sk,
        cp_department,
        cp_catalog_number,
        cp_catalog_page_number,
        cp_description,
        cp_type
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__catalog_returns.sql

with source as (

    select * from {{ source('tpcds', 'catalog_returns') }}

),

renamed as (

    select
        cr_returned_date_sk as returned_date_sk,
        cr_returned_time_sk as returned_time_sk,
        cr_item_sk as item_sk,
        cr_refunded_customer_sk as refunded_customer_sk,
        cr_refunded_cdemo_sk as refunded_cdemo_sk,
        cr_refunded_hdemo_sk as refunded_hdemo_sk,
        cr_refunded_addr_sk as refunded_addr_sk,
        cr_returning_customer_sk as returning_customer_sk,
        cr_returning_cdemo_sk as returning_cdemo_sk,
        cr_returning_hdemo_sk as returning_hdemo_sk,
        cr_returning_addr_sk as returning_addr_sk,
        cr_call_center_sk as call_center_sk,
        cr_catalog_page_sk as catalog_page_sk,
        cr_ship_mode_sk as ship_mode_sk,
        cr_warehouse_sk as warehouse_sk,
        cr_reason_sk as reason_sk,
        cr_order_number,
        cr_return_quantity,
        cr_return_amount,
        cr_return_tax,
        cr_return_amt_inc_tax as return_amt_inc_tax,
        cr_fee,
        cr_return_ship_cost as return_ship_cost,
        cr_refunded_cash,
        cr_reversed_charge,
        cr_store_credit,
        cr_net_loss
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__catalog_sales.sql

with source as (

    select * from {{ source('tpcds', 'catalog_sales') }}

),

renamed as (

    select
        cs_sold_date_sk as sold_date_sk,
        cs_sold_time_sk as sold_time_sk,
        cs_ship_date_sk as ship_date_sk,
        cs_bill_customer_sk as bill_customer_sk,
        cs_bill_cdemo_sk as bill_cdemo_sk,
        cs_bill_hdemo_sk as bill_hdemo_sk,
        cs_bill_addr_sk as bill_addr_sk,
        cs_ship_customer_sk as ship_customer_sk,
        cs_ship_cdemo_sk as ship_cdemo_sk,
        cs_ship_hdemo_sk as ship_hdemo_sk,
        cs_ship_addr_sk as ship_addr_sk,
        cs_call_center_sk as call_center_sk,
        cs_catalog_page_sk as catalog_page_sk,
        cs_ship_mode_sk as ship_mode_sk,
        cs_warehouse_sk as warehouse_sk,
        cs_item_sk as item_sk,
        cs_promo_sk as promo_sk,
        cs_order_number,
        cs_quantity,
        cs_wholesale_cost,
        cs_list_price,
        cs_sales_price,
        cs_ext_discount_amt as ext_discount_amt,
        cs_ext_sales_price as ext_sales_price,
        cs_ext_wholesale_cost as ext_wholesale_cost,
        cs_ext_list_price as ext_list_price,
        cs_ext_tax,
        cs_coupon_amt,
        cs_ext_ship_cost as ext_ship_cost,
        cs_net_paid,
        cs_net_paid_inc_tax as net_paid_inc_tax,
        cs_net_paid_inc_ship as net_paid_inc_ship,
        cs_net_paid_inc_ship_tax as net_paid_inc_ship_tax,
        cs_net_profit
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__customer.sql

with source as (

    select * from {{ source('tpcds', 'customer') }}

),

renamed as (

    select
        c_customer_sk as customer_sk,
        c_customer_id as customer_id,
        c_current_cdemo_sk as current_cdemo_sk,
        c_current_hdemo_sk as current_hdemo_sk,
        c_current_addr_sk as current_addr_sk,
        c_first_shipto_date_sk as first_shipto_date_sk,
        c_first_sales_date_sk as first_sales_date_sk,
        c_salutation,
        c_first_name,
        c_last_name,
        c_preferred_cust_flag as preferred_cust_flag,
        c_birth_day as birth_day,
        c_birth_month as birth_month,
        c_birth_year as birth_year,
        c_birth_country as birth_country,
        c_login,
        c_email_address as email_address,
        c_last_review_date_sk as last_review_date_sk
    from source

)

select * from renamed;
```
```sql
-- stg_tpcds__customer_address.sql

with source as (

    select * from {{ source('tpcds', 'customer_address') }}

),

renamed as (

    select
        ca_address_sk as address_sk,
        ca_address_id as address_id,
        ca_street_number,
        ca_street_name,
        ca_street_type,
        ca_suite_number,
        ca_city,
        ca_county,
        ca_state,
        ca_zip,
        ca_country,
        ca_gmt_offset as gmt_offset,
        ca_location_type as location_type
    from source

)

select * from renamed;
```
```sql
-- stg_tpcds__customer_demographics.sql

with source as (

    select * from {{ source('tpcds', 'customer_demographics') }}

),

renamed as (

    select
        cd_demo_sk as demo_sk,
        cd_gender,
        cd_marital_status as marital_status,
        cd_education_status as education_status,
        cd_purchase_estimate as purchase_estimate,
        cd_credit_rating as credit_rating,
        cd_dep_count as dep_count,
        cd_dep_employed_count as dep_employed_count,
        cd_dep_college_count as dep_college_count
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__date_dim.sql

with source as (

    select * from {{ source('tpcds', 'date_dim') }}

),

renamed as (

    select
        d_date_sk as date_sk,
        d_date_id as date_id,
        d_date,
        d_month_seq as month_seq,
        d_week_seq as week_seq,
        d_quarter_seq as quarter_seq,
        d_year,
        d_dow,
        d_moy,
        d_dom,
        d_qoy,
        d_fy_year as fy_year,
        d_fy_quarter_seq as fy_quarter_seq,
        d_fy_week_seq as fy_week_seq,
        d_day_name as day_name,
        d_quarter_name as quarter_name,
        d_holiday,
        d_weekend,
        d_following_holiday as following_holiday,
        d_first_dom as first_dom,
        d_last_dom as last_dom,
        d_same_day_ly as same_day_ly,
        d_same_day_lq as same_day_lq,
        d_current_day as current_day,
        d_current_week as current_week,
        d_current_month as current_month,
        d_current_quarter as current_quarter,
        d_current_year as current_year
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__household_demographics.sql

with source as (

    select * from {{ source('tpcds', 'household_demographics') }}

),

renamed as (

    select
        hd_demo_sk as demo_sk,
        hd_income_band_sk as income_band_sk,
        hd_buy_potential as buy_potential,
        hd_dep_count as dep_count,
        hd_vehicle_count as vehicle_count
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__income_band.sql

with source as (

    select * from {{ source('tpcds', 'income_band') }}

),

renamed as (

    select
        ib_income_band_sk as income_band_sk,
        ib_lower_bound as lower_bound,
        ib_upper_bound as upper_bound
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__inventory.sql

with source as (

    select * from {{ source('tpcds', 'inventory') }}

),

renamed as (

    select
        inv_date_sk as date_sk,
        inv_item_sk as item_sk,
        inv_warehouse_sk as warehouse_sk,
        inv_quantity_on_hand as quantity_on_hand
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__item.sql

with source as (

    select * from {{ source('tpcds', 'item') }}

),

renamed as (

    select
        i_item_sk as item_sk,
        i_item_id as item_id,
        i_rec_start_date as rec_start_date,
        i_rec_end_date as rec_end_date,
        i_item_desc as item_desc,
        i_current_price as current_price,
        i_wholesale_cost as wholesale_cost,
        i_brand_id as brand_id,
        i_brand,
        i_class_id as class_id,
        i_class,
        i_category_id as category_id,
        i_category,
        i_manufact_id as manufact_id,
        i_manufact,
        i_size,
        i_formulation,
        i_color,
        i_units,
        i_container,
        i_manager_id as manager_id,
        i_product_name as product_name
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__promotion.sql

with source as (

    select * from {{ source('tpcds', 'promotion') }}

),

renamed as (

    select
        p_promo_sk as promo_sk,
        p_promo_id as promo_id,
        p_start_date_sk as start_date_sk,
        p_end_date_sk as end_date_sk,
        p_item_sk as item_sk,
        p_cost,
        p_response_target as response_target,
        p_promo_name as promo_name,
        p_channel_dmail as channel_dmail,
        p_channel_email as channel_email,
        p_channel_catalog as channel_catalog,
        p_channel_tv as channel_tv,
        p_channel_radio as channel_radio,
        p_channel_press as channel_press,
        p_channel_event as channel_event,
        p_channel_demo as channel_demo,
        p_channel_details as channel_details,
        p_purpose,
        p_discount_active as discount_active
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__reason.sql

with source as (

    select * from {{ source('tpcds', 'reason') }}

),

renamed as (

    select
        r_reason_sk as reason_sk,
        r_reason_id as reason_id,
        r_reason_desc as reason_desc
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__ship_mode.sql

with source as (

    select * from {{ source('tpcds', 'ship_mode') }}

),

renamed as (

    select
        sm_ship_mode_sk as ship_mode_sk,
        sm_ship_mode_id as ship_mode_id,
        sm_type,
        sm_code,
        sm_carrier,
        sm_contract
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__store.sql

with source as (

    select * from {{ source('tpcds', 'store') }}

),

renamed as (

    select
        s_store_sk as store_sk,
        s_store_id as store_id,
        s_rec_start_date as rec_start_date,
        s_rec_end_date as rec_end_date,
        s_closed_date_sk as closed_date_sk,
        s_store_name as store_name,
        s_number_employees as number_employees,
        s_floor_space as floor_space,
        s_hours,
        s_manager,
        s_market_id as market_id,
        s_geography_class as geography_class,
        s_market_desc as market_desc,
        s_market_manager,
        s_division_id as division_id,
        s_division_name as division_name,
        s_company_id as company_id,
        s_company_name as company_name,
        s_street_number,
        s_street_name,
        s_street_type,
        s_suite_number,
        s_city,
        s_county,
        s_state,
        s_zip,
        s_country,
        s_gmt_offset as gmt_offset,
        s_tax_percentage as tax_percentage
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__store_returns.sql

with source as (

    select * from {{ source('tpcds', 'store_returns') }}

),

renamed as (

    select
        sr_returned_date_sk as returned_date_sk,
        sr_return_time_sk as return_time_sk,
        sr_item_sk as item_sk,
        sr_customer_sk as customer_sk,
        sr_cdemo_sk as cdemo_sk,
        sr_hdemo_sk as hdemo_sk,
        sr_addr_sk as addr_sk,
        sr_store_sk as store_sk,
        sr_reason_sk as reason_sk,
        sr_ticket_number as ticket_number,
        sr_return_quantity as return_quantity,
        sr_return_amt as return_amt,
        sr_return_tax,
        sr_return_amt_inc_tax as return_amt_inc_tax,
        sr_fee,
        sr_return_ship_cost as return_ship_cost,
        sr_refunded_cash,
        sr_reversed_charge,
        sr_store_credit,
        sr_net_loss
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__store_sales.sql

with source as (

    select * from {{ source('tpcds', 'store_sales') }}

),

renamed as (

    select
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
        ss_quantity,
        ss_wholesale_cost,
        ss_list_price,
        ss_sales_price,
        ss_ext_discount_amt as ext_discount_amt,
        ss_ext_sales_price as ext_sales_price,
        ss_ext_wholesale_cost as ext_wholesale_cost,
        ss_ext_list_price as ext_list_price,
        ss_ext_tax,
        ss_coupon_amt,
        ss_net_paid,
        ss_net_paid_inc_tax as net_paid_inc_tax,
        ss_net_profit
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__time_dim.sql

with source as (

    select * from {{ source('tpcds', 'time_dim') }}

),

renamed as (

    select
        t_time_sk as time_sk,
        t_time_id as time_id,
        t_time,
        t_hour,
        t_minute,
        t_second,
        t_am_pm as am_pm,
        t_shift,
        t_sub_shift as sub_shift,
        t_meal_time as meal_time
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__warehouse.sql

with source as (

    select * from {{ source('tpcds', 'warehouse') }}

),

renamed as (

    select
        w_warehouse_sk as warehouse_sk,
        w_warehouse_id as warehouse_id,
        w_warehouse_name as warehouse_name,
        w_warehouse_sq_ft as warehouse_sq_ft,
        w_street_number,
        w_street_name,
        w_street_type,
        w_suite_number,
        w_city,
        w_county,
        w_state,
        w_zip,
        w_country,
        w_gmt_offset as gmt_offset
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__web_page.sql

with source as (

    select * from {{ source('tpcds', 'web_page') }}

),

renamed as (

    select
        wp_web_page_sk as web_page_sk,
        wp_web_page_id as web_page_id,
        wp_rec_start_date as rec_start_date,
        wp_rec_end_date as rec_end_date,
        wp_creation_date_sk as creation_date_sk,
        wp_access_date_sk as access_date_sk,
        wp_autogen_flag as autogen_flag,
        wp_customer_sk as customer_sk,
        wp_url,
        wp_type,
        wp_char_count as char_count,
        wp_link_count as link_count,
        wp_image_count as image_count,
        wp_max_ad_count as max_ad_count
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__web_returns.sql

with source as (

    select * from {{ source('tpcds', 'web_returns') }}

),

renamed as (

    select
        wr_returned_date_sk as returned_date_sk,
        wr_returned_time_sk as returned_time_sk,
        wr_item_sk as item_sk,
        wr_refunded_customer_sk as refunded_customer_sk,
        wr_refunded_cdemo_sk as refunded_cdemo_sk,
        wr_refunded_hdemo_sk as refunded_hdemo_sk,
        wr_refunded_addr_sk as refunded_addr_sk,
        wr_returning_customer_sk as returning_customer_sk,
        wr_returning_cdemo_sk as returning_cdemo_sk,
        wr_returning_hdemo_sk as returning_hdemo_sk,
        wr_returning_addr_sk as returning_addr_sk,
        wr_web_page_sk as web_page_sk,
        wr_reason_sk as reason_sk,
        wr_order_number as order_number,
        wr_return_quantity as return_quantity,
        wr_return_amt as return_amt,
        wr_return_tax,
        wr_return_amt_inc_tax as return_amt_inc_tax,
        wr_fee,
        wr_return_ship_cost as return_ship_cost,
        wr_refunded_cash,
        wr_reversed_charge,
        wr_account_credit as account_credit,
        wr_net_loss as net_loss
    from source

)

select * from renamed;
```

```sql
-- stg_tpcds__web_sales.sql

with source as (

    select * from {{ source('tpcds', 'web_sales') }}

),

renamed as (

    select
        ws_sold_date_sk as sold_date_sk,
        ws_sold_time_sk as sold_time_sk,
        ws_ship_date_sk as ship_date_sk,
