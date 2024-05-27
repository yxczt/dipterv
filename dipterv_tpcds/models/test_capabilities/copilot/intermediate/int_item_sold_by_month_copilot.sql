-- item sold by month
-- time to develop code: 40.50 seconds
-- score: 1 * 1 + 0 * 2 + 0 * 10 = 1

{{ config(materialized='table') }}

SELECT
    DATE_TRUNC('month', date) AS month,
    COUNT(ws_item_sk) AS items_sold
FROM
    {{ ref('stg_web_sales') }} ws
JOIN
    {{ ref('stg_tpcds_date_dim') }} dd ON ws.ws_sold_date_sk = dd.date_sk
GROUP BY
    month
ORDER BY
    month