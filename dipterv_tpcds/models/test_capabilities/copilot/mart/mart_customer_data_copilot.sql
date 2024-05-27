-- customer data by nations and regions with various dimensions
--time to develop code: 1 minute 2.63 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

{{ config(materialized='table') }}

SELECT
    c_current_cdemo_sk AS nation,
    c_current_hdemo_sk AS region,
    COUNT(DISTINCT c_customer_sk) AS total_customers,
    COUNT(DISTINCT c_salutation) AS distinct_salutations,
    AVG(c_birth_year) AS avg_birth_year,
    COUNT(DISTINCT c_birth_country) AS distinct_birth_countries,
    COUNT(DISTINCT c_login) AS distinct_logins,
    COUNT(DISTINCT c_email_address) AS distinct_email_addresses
FROM
    {{ ref('stg_customer_copilot') }}  -- reference to your staging model
GROUP BY
    c_current_cdemo_sk,
    c_current_hdemo_sk