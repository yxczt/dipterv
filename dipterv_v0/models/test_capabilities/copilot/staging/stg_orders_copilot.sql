-- staging model for orders
--time to develop code: 25.79 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- stg_orders_copilot.sql

SELECT
    o.orderkey AS order_id,
    o.custkey AS customer_id,
    o.orderstatus AS order_status,
    o.totalprice AS total_price,
    o.orderdate AS order_date,
    o.orderpriority AS order_priority,
    o.clerk AS clerk,
    o.shippriority AS ship_priority,
    o.comment AS comment
FROM 
    {{ source('tpch', 'tpch_orders') }} AS o