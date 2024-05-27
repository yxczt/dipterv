--test that a total count of items in int_item_sold_by_month is equal to the total count of items in int_lineitem_sold_per_customer
--time to develop code: 26.99 seconds
--score: 2 * 1 + 1 * 2 + 1 * 10 = 14

-- tests/total_count_eq.sql

{% macro test_total_count_eq(model) %}
  SELECT
    CASE WHEN
      (SELECT COUNT(*) FROM int_item_sold_by_month) = (SELECT COUNT(*) FROM int_lineitem_sold_per_customer)
    THEN 0
    ELSE 1
    END AS test_result
{% endmacro %}