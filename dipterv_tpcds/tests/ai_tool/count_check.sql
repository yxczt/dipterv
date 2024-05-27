--test that a total count of items in int_item_sold_by_month is equal to the total count of items in int_lineitem_sold_per_customer
--time to develop code: 2 minute 54.32 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

--test that a total count of items in int_item_sold_by_month is equal to the total count of items in int_lineitem_sold_per_customer

select
    (select sum(total_quantity_sold) from {{ ref('int_item_sold_by_month') }}) as total_items_sold_by_month,
    (select sum(ws_quantity) from {{ ref('int_lineitem_sold_per_customer') }}) as total_items_sold_per_customer
having
    total_items_sold_by_month != total_items_sold_per_customer