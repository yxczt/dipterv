select mo.customer_id, sum(mo.order_total_price) as mart_orders_total_price, ioe.total_price as int_orders_enriched_total_price
from {{ ref('mart_orders') }} mo
join {{ ref('int_orders_enriched') }} ioe on mo.customer_id = ioe.customer_id
group by mo.customer_id, ioe.total_price
having sum(mo.order_total_price) != ioe.total_price