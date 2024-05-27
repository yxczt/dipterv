-- ordering habits by nation
--time to develop code: 1 minute 16.66 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

{{ config(materialized='table') }}

SELECT
    current_cdemo_sk AS nation,
    COUNT(DISTINCT ws_order_number) AS total_orders,
    SUM(ws_ext_sales_price) AS total_revenue
FROM
    {{ ref('stg_web_sales') }} ws
JOIN
    {{ ref('stg_customer') }} c ON ws.ws_bill_customer_sk = c.customer_sk
GROUP BY
    current_cdemo_sk