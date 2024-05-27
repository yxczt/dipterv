--max revenue per customer by region
--time to develop code: 1 minute 34.02 seconds
--score: 1 * 1 + 1 * 2 + 0 * 10 = 3

{{ config(materialized='table') }}

WITH customer_revenue AS (
    SELECT
        customer_sk AS customer_id,
        current_cdemo_sk AS region,
        SUM(ws_ext_sales_price) AS total_revenue
    FROM
        {{ ref('stg_web_sales') }} ws
    JOIN
        {{ ref('stg_customer') }} c ON ws.ws_bill_customer_sk = c.customer_sk
    GROUP BY
        customer_sk,
        current_cdemo_sk
)

SELECT
    region,
    MAX(total_revenue) AS max_revenue_per_customer
FROM
    customer_revenue
GROUP BY
    region