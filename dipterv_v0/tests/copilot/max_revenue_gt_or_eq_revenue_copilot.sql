-- max revenue in int_lineitem_revenue is greater than or equal to total revenue in int_orders_enriched
--time to develop code: 1 minute 5.65 seconds
--score: 1 * 1 + 1 * 2 + 1 * 10 = 13

SELECT 
    (SELECT MAX(revenue) FROM int_lineitem_revenue) >= (SELECT SUM(total_revenue) FROM int_orders_enriched) AS test_result;