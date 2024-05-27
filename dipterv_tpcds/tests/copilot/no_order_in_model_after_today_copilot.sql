-- no order after today in a model with a date type column
--time to develop code: 35,62 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- tests/no_order_after_today.sql

{% macro test_no_order_after_today(model) %}
  SELECT
    COUNT(*)
  FROM
    {{ model }}
  WHERE
    order_date > CURRENT_DATE()
{% endmacro %}