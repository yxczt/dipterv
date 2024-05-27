-- if the quantity of items sold in int_item_sold_by_month_copilot is not 0, than the total revenue should be not 0 in mart_order_revenue
--time to develop code: 1 minute 0.29 seconds
--score: 2 * 1 + 1 * 2 + 1 * 10 = 14

-- tests/quantity_sold_revenue_check.sql

{% macro test_quantity_sold_revenue_check(model) %}
  SELECT
    i.quantity,
    m.total_revenue
  FROM
    (SELECT SUM(quantity) as quantity FROM int_item_sold_by_month_copilot) i
  JOIN
    (SELECT SUM(revenue) as total_revenue FROM mart_order_revenue) m
  WHERE
    (i.quantity <> 0 AND m.total_revenue = 0)
{% endmacro %}