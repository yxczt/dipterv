-- lineitems bought by customer
--time to develop code: 58.95 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- int_lineitems_bought_by_customer.sql

SELECT
    o.customer_id,
    COUNT(l.line_number) as lineitems_bought
FROM 
    {{ ref('stg_tpch_orders') }} o
JOIN
    {{ ref('stg_tpch_lineitem') }} l
ON
    l.order_id = o.order_id
GROUP BY 
    o.customer_id