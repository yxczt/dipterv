select
    i.month,
    i.items_sold,
    m.total_net_paid
from {{ ref('int_item_sold_by_month_copilot') }} i
left join {{ ref('mart_order_revenue') }} m on i.month = m.month
where i.items_sold != 0 and m.total_net_paid = 0