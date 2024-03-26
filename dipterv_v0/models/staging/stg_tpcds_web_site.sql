with source as (

    select * from {{ source('tpcds','web_site') }}

),

renamed as (

    select
        -- ids
        web_site_sk as web_site_id,
        web_site_id as web_site_code,

        -- strings
        web_name,
        web_class,
        web_manager,
        web_mkt_class,
        web_mkt_desc,
        web_market_manager,
        web_company_name,
        web_street_number,
        web_street_name,
        web_street_type,
        web_suite_number,
        web_city,
        web_county,
        web_state,
        web_zip,
        web_country,
        web_tax_percentage,

        -- dates
        web_rec_start_date as record_start_date,
        web_rec_end_date as record_end_date,

        -- numerics
        web_open_date_sk as open_date_id,
        web_close_date_sk as close_date_id,
        web_mkt_id as market_id,
        web_company_id as company_id,
        web_gmt_offset as gmt_offset

    from source

)

select * from renamed