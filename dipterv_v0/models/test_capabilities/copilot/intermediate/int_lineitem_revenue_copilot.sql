--max revenue per customer by region
--time to develop code: 3 minutes 39.05 seconds
--score: 2 * 1 + 1 * 2 + 0 * 10 = 4

WITH revenue_per_customer_by_region AS (
    SELECT
        r.region_id,
        c.customer_id,
        SUM(o.total_price) as total_revenue
    FROM 
        {{ ref('stg_tpch_orders') }} o
    JOIN
        {{ ref('stg_tpch_customer') }} c
    ON
        c.customer_id = o.customer_id
    JOIN
        {{ ref('stg_tpch_nation') }} n
    ON
        n.nation_id = c.nation_id
    JOIN
        {{ ref('stg_tpch_region') }} r
    ON
        r.region_id = n.region_id
    GROUP BY 
        r.region_id, c.customer_id
)

SELECT
    region_id,
    customer_id,
    MAX(total_revenue) as max_revenue
FROM 
    revenue_per_customer_by_region
GROUP BY 
    region_id, customer_id