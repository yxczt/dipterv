-- if the quantity of items sold in int_item_sold_by_month_copilot is not 0, than the total revenue should be not 0 in mart_order_revenue
--time to develop code: 1 minute 58.26 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

-- if the quantity of items sold in int_item_sold_by_month_copilot is not 0, than the total revenue should be not 0 in mart_order_revenue

select
    i.month,
    i.items_sold,
    m.total_net_paid
from {{ ref('int_item_sold_by_month_copilot') }} i
left join {{ ref('mart_order_revenue') }} m on i.month = m.month
where i.items_sold != 0 and m.total_net_paid = 0