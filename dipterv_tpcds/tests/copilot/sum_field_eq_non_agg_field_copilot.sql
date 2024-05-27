-- aggregated field in a model is equal to a non aggregated one
--time to develop code: 27.44 seconds
--score: 0 * 1 + 2 * 2 + 0 * 10 = 4

-- tests/aggregated_field_eq_non_agg.sql

{% macro test_aggregated_field_eq_non_agg(model) %}
  SELECT
    COUNT(*)
  FROM
    {{ model }} AS m
  JOIN
    your_other_table AS o
  ON
    m.id = o.id
  WHERE
    m.aggregated_field <> o.non_aggregated_field
{% endmacro %}