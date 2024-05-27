--test that a field in a table by order_id is the same as a field in another table by order_id
--time to develop code: 24.95 seconds
--score: 0 * 1 + 2 * 2 + 0 * 10 = 4

-- tests/order_id_fields_eq.sql

{% macro test_order_id_fields_eq(model) %}
  SELECT
    COUNT(*)
  FROM
    {{ model }} AS m
  JOIN
    your_other_table AS o
  ON
    m.order_id = o.order_id
  WHERE
    m.your_field <> o.your_field
{% endmacro %}