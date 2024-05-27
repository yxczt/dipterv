-- staging model for tpcds web_sales
--time to develop code: 31.45 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

{{ config(materialized='table') }}

SELECT *
FROM {{ source('tpcds', 'web_sales') }}