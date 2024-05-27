-- ordering habits by nation
--time to develop code: 24.15 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

-- int_ordering_habits_per_nation.sql

WITH ordering_habits AS (
    SELECT
        n.nation_name,
        COUNT(DISTINCT o.order_id) as number_of_orders,
        SUM(l.quantity) as total_quantity,
        SUM(l.extended_price) as total_revenue
    FROM 
        {{ ref('stg_tpch_orders') }} o
    JOIN
        {{ ref('stg_tpch_lineitem') }} l
    ON
        l.order_id = o.order_id
    JOIN
        {{ ref('stg_tpch_customer') }} c
    ON
        c.customer_id = o.customer_id
    JOIN
        {{ ref('stg_tpch_nation') }} n
    ON
        n.nation_id = c.nation_id
    GROUP BY 
        n.nation_name
)

SELECT
    nation_name,
    number_of_orders,
    total_quantity,
    total_revenue
FROM 
    ordering_habits