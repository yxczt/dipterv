-- staging model for tpcds item
--time to develop code: 24.64 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

{{ config(materialized='table') }}

SELECT *
FROM {{ source('tpcds', 'item') }}