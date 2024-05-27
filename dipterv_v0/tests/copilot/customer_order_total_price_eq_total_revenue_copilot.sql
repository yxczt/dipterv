--test that a customer's orders' total price in mart_orders is equal to the total revenue for a customer in int_orders_enriched
--time to develop code: 1 minute 3.23 seconds
--score: 2 * 1 + 1 * 2 + 1 * 10 = 14

SELECT 
    mart_orders.customer_id,
    mart_orders.total_price,
    int_orders_enriched.total_revenue
FROM 
    mart_orders
JOIN 
    int_orders_enriched
ON 
    mart_orders.customer_id = int_orders_enriched.customer_id
WHERE 
    mart_orders.total_price != int_orders_enriched.total_revenue