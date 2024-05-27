with source as (

    select * from {{ source('tpcds','customer_demographics') }}

),

renamed as (

    select
        -- ids
        cd_demo_sk as demo_sk,
        cd_gender as gender,
        cd_marital_status as marital_status,
        cd_education_status as education_status,
        cd_purchase_estimate as purchase_estimate,
        cd_credit_rating as credit_rating,
        cd_dep_count as dep_count,
        cd_dep_employed_count as dep_employed_count,
        cd_dep_college_count as dep_college_count

    from source

)

select * from renamed