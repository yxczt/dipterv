-- lineitems bought by customer
--time to develop code: 30.03 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

{{ config(materialized='table') }}

SELECT
    ws_bill_customer_sk AS customer_id,
    COUNT(ws_item_sk) AS lineitems_bought
FROM
    {{ ref('stg_web_sales') }}  -- reference to your staging model
GROUP BY
    ws_bill_customer_sk