with customer as (
    select
        customer_sk,
        customer_id,
        current_cdemo_sk,
        current_hdemo_sk,
        current_addr_sk
    from {{ ref('stg_customer') }}
),

customer_demographics as (
    select
        demo_sk,
        gender,
        marital_status,
        education_status,
        purchase_estimate,
        credit_rating
    from {{ ref('stg_customer_demographics') }}
),

household_demographics as (
    select
        household_demo_sk,
        income_band_sk,
        buy_potential,
        dependent_count,
        vehicle_count
    from {{ ref('stg_household_demographics') }}
),

income_band as (
    select
        income_band_sk,
        lower_bound,
        upper_bound
    from {{ ref('stg_income_band') }}
),

customer_address as (
    select
        address_sk,
        city,
        state,
        country,
        zip
    from {{ ref('stg_customer_address') }}
),

customer_details as (
    select
        c.customer_sk,
        c.customer_id,
        cd.gender,
        cd.marital_status,
        cd.education_status,
        cd.purchase_estimate,
        cd.credit_rating,
        hd.buy_potential,
        hd.dependent_count,
        hd.vehicle_count,
        ib.lower_bound,
        ib.upper_bound,
        ca.city,
        ca.state,
        ca.country,
        ca.zip
    from customer c
    left join customer_demographics cd on c.current_cdemo_sk = cd.demo_sk
    left join household_demographics hd on c.current_hdemo_sk = hd.household_demo_sk
    left join income_band ib on hd.income_band_sk = ib.income_band_sk
    left join customer_address ca on c.current_addr_sk = ca.address_sk
)

select * from customer_details