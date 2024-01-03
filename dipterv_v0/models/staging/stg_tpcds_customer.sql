with source as (

    select * from {{ source('tpcds', 'customer') }}

),

renamed as (

    select
        -- ids
        c_customer_sk as customer_sk,
        c_customer_id as customer_id,

        -- strings
        c_first_name as first_name,
        c_last_name as last_name,
        c_email_address as email_address,
        c_preferred_cust_flag as preferred_customer_flag,
        c_birth_country as birth_country,
        c_login as login,
        c_last_review_date_sk as last_review_date_sk,

        -- numerics
        c_current_cdemo_sk as current_cdemo_sk,
        c_current_hdemo_sk as current_hdemo_sk,
        c_current_addr_sk as current_addr_sk,
        c_first_shipto_date_sk as first_shipto_date_sk,
        c_first_sales_date_sk as first_sales_date_sk,

        -- numerics (part 2)
        c_birth_day as birth_day,
        c_birth_month as birth_month,
        c_birth_year as birth_year,
        c_salutation as salutation

    from source

)

select * from renamed