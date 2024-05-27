-- if the avg revenue per order in int_avg_revenue_per_customer_order is not 0, then the total orders in int_customers_orders_analyzed should be greater than 0
--time to develop code: 1 minute 0.29 seconds
--score: 1 * 1 + 0 * 2 + 1 * 10 = 11


SELECT 
    int_avg_revenue_per_customer_order.customer_id,
    int_avg_revenue_per_customer_order.avg_revenue_per_order,
    int_customers_orders_analyzed.total_orders
FROM 
    int_avg_revenue_per_customer_order
JOIN 
    int_customers_orders_analyzed
ON 
    int_avg_revenue_per_customer_order.customer_id = int_customers_orders_analyzed.customer_id
WHERE 
    int_avg_revenue_per_customer_order.avg_revenue_per_order != 0 AND int_customers_orders_analyzed.total_orders <= 0;