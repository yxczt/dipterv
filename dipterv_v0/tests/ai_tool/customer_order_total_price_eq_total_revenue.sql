--test that a customer's orders' total price in mart_orders is equal to the total revenue for a customer in int_orders_enriched
--time to develop code: 1 minute 51.36 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

select 
    mo.customer_id, 
    sum(mo.order_total_price) as mart_orders_total_price, 
    ioe.total_price as int_orders_enriched_total_price
from {{ ref('mart_orders') }} mo
join {{ ref('int_orders_enriched') }} ioe 
on mo.customer_id = ioe.customer_id
group by mo.customer_id, ioe.total_price
having sum(mo.order_total_price) != ioe.total_price