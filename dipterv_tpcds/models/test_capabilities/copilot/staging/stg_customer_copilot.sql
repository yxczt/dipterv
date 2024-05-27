-- staging model for tpcds customer
--time to develop code: 21.90 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

{{ config(materialized='table') }}

SELECT *
FROM {{ source('tpcds', 'customer') }}