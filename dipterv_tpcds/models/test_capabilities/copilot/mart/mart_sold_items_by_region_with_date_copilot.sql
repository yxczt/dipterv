-- sold items by region with date with various dimensions
-- time to develop code: 1 minute 7.87 seconds
-- score: 3 * 1 + 1 * 2 + 0 * 10 = 4

SELECT
    current_cdemo_sk AS region,
    dd.moy AS month,
    COUNT(ws_item_sk) AS items_sold
FROM
    {{ ref('stg_web_sales') }} ws
JOIN
    {{ ref('stg_customer') }} c ON ws.ws_bill_customer_sk = c.customer_sk
JOIN
    {{ ref('stg_tpcds_date_dim') }} dd ON ws.ws_sold_date_sk = dd.date_sk
GROUP BY
    region,
    month
ORDER BY
    region,
    month