-- sold parts by region with date with various dimensions
-- time to develop code: 1 minute 2.18 seconds
-- score: 2 * 1 + 1 * 2 + 0 * 10 = 3

-- mart_sold_parts_by_region_with_date.sql

SELECT
    r.region_name,
    DATE_TRUNC('DAY', o.order_date) AS date,
    p.part_id,
    p.part_name,
    COUNT(DISTINCT l.line_number) AS number_of_parts_sold,
    SUM(l.quantity) AS total_quantity,
    SUM(l.extended_price) AS total_revenue
FROM 
    {{ ref('stg_tpch_lineitem') }} AS l
JOIN
    {{ ref('stg_part_copilot') }} AS p
ON
    p.part_id = l.part_id
JOIN
    {{ ref('stg_orders_copilot') }} AS o
ON
    o.order_id = l.order_id
JOIN
    {{ ref('stg_customer_copilot') }} AS c
ON
    c.customer_id = o.customer_id
JOIN
    {{ ref('stg_tpch_nation') }} AS n
ON
    n.nation_id = c.nation_id
JOIN
    {{ ref('stg_tpch_region') }} AS r
ON
    r.region_id = n.region_id
GROUP BY 
    r.region_name, DATE_TRUNC('DAY', o.order_date), p.part_id, p.part_name