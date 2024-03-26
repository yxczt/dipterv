with source as (

    select * from {{ source('tpcds','customer_address') }}

),

renamed as (

    select
        -- ids
        ca_address_sk as address_sk,
        ca_address_id as address_id,

        -- strings
        ca_street_number as street_number,
        ca_street_name as street_name,
        ca_street_type as street_type,
        ca_suite_number as suite_number,
        ca_city as city,
        ca_county as county,
        ca_state as state,
        ca_zip as zip,
        ca_country as country,
        ca_location_type as location_type,

        -- numerics
        ca_gmt_offset as gmt_offset

    from source

)

select * from renamed
