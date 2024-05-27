--average revenue per customer
--time to develop code: 40.04 seconds
--score: 2 * 1 + 0 * 2 + 0 * 10 = 2

{{ config(materialized='table') }}

WITH customer_orders AS (
    SELECT
        ws_bill_customer_sk AS customer_id,
        SUM(ws_ext_sales_price) AS total_revenue
    FROM
        {{ ref('stg_web_sales_copilot') }}  -- reference to your staging model
    GROUP BY
        ws_bill_customer_sk
)

SELECT
    customer_id,
    AVG(total_revenue) AS avg_revenue_per_customer_order
FROM
    customer_orders
GROUP BY
    customer_id