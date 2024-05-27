-- order revenue for analytical purposes by various dimensions
--time to develop code: 57.65 seconds
--score: 1 * 1 + 1 * 2 + 0 * 10 = 3

{{ config(materialized='table') }}

SELECT
    ws_bill_customer_sk AS customer_id,
    ws_item_sk AS item_id,
    DATE_TRUNC('month', date) AS month,
    SUM(ws_ext_sales_price) AS total_revenue
FROM
    {{ ref('stg_web_sales') }} ws
JOIN
    {{ ref('stg_tpcds_date_dim') }} dd ON ws.ws_sold_date_sk = dd.date_sk
GROUP BY
    customer_id,
    item_id,
    month