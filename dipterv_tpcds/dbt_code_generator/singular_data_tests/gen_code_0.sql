select
    (select sum(total_quantity_sold) from {{ ref('int_item_sold_by_month') }}) as total_items_sold_by_month,
    (select sum(ws_quantity) from {{ ref('int_lineitem_sold_per_customer') }}) as total_items_sold_per_customer
having
    total_items_sold_by_month != total_items_sold_per_customer