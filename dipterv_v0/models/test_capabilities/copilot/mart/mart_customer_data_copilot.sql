-- customer data by nations and regions with various dimensions
--time to develop code: 24.25 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- mart_customer_data.sql

SELECT
    c.customer_id,
    c.name AS customer_name,
    c.market_segment,
    n.nation_name,
    r.region_name,
    COUNT(DISTINCT o.order_id) AS number_of_orders,
    SUM(o.total_price) AS total_revenue
FROM 
    {{ ref('stg_customer_copilot') }} AS c
JOIN
    {{ ref('stg_tpch_nation') }} AS n
ON
    n.nation_id = c.nation_id
JOIN
    {{ ref('stg_tpch_region') }} AS r
ON
    r.region_id = n.region_id
LEFT JOIN
    {{ ref('stg_orders_copilot') }} AS o
ON
    o.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.name, c.market_segment, n.nation_name, r.region_name