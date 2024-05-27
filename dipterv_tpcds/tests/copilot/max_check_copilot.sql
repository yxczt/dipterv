-- the avg revenue per customer in int_avg_revenue_per_customer_order equal or less than the max revenue int_lineitem_revenue
--time to develop code: 1 minute 1.30 seconds
--score: 2 * 1 + 1 * 2 + 1 * 10 = 14

-- tests/avg_revenue_le_max_revenue.sql

{% macro test_avg_revenue_le_max_revenue(model) %}
  SELECT
    AVG(revenue) as avg_revenue,
    (SELECT MAX(revenue) FROM int_lineitem_revenue) as max_revenue
  FROM
    int_avg_revenue_per_customer_order
  WHERE
    AVG(revenue) > (SELECT MAX(revenue) FROM int_lineitem_revenue)
{% endmacro %}