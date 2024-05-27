-- order revenue for analytical purposes by various dimensions
--time to develop code: 19.39 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- mart_order_revenue_by_dimensions.sql

SELECT
    o.order_id,
    o.customer_id,
    c.name AS customer_name,
    c.market_segment,
    p.part_id,
    p.part_name,
    s.supplier_id,
    s.supplier_name,
    SUM(l.extended_price) AS total_revenue
FROM 
    {{ ref('stg_orders_copilot') }} AS o
JOIN
    {{ ref('stg_tpch_lineitem') }} AS l
ON
    l.order_id = o.order_id
JOIN
    {{ ref('stg_customer_copilot') }} AS c
ON
    c.customer_id = o.customer_id
JOIN
    {{ ref('stg_tpch_partsupp') }} AS ps
ON
    ps.part_id = l.part_id AND ps.supplier_id = l.supplier_id
JOIN
    {{ ref('stg_part_copilot') }} AS p
ON
    p.part_id = ps.part_id
JOIN
    {{ ref('stg_tpch_supplier') }} AS s
ON
    s.supplier_id = ps.supplier_id
GROUP BY 
    o.order_id, o.customer_id, c.name, c.market_segment, p.part_id, p.part_name, s.supplier_id, s.supplier_name
