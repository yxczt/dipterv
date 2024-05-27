--tests/generic/test_no_order_after_today.sql
{% test no_order_after_today(model, column_name) %}

    select
        {{ column_name }}

    from {{ model }}

    where {{ column_name }} > current_date

{% endtest %}

version: 2

models:
  - name: int_customers_orders_analyzed
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: int_orders_aggregated
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: int_orders_enriched
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: int_parts_and_orders
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: int_parts_and_orders_enriched
    tests:
      - no_order_after_today:
          column_name: earliest_order_date
      - no_order_after_today:
          column_name: latest_order_date

  - name: mart_orders
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: mart_order_revenue
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: mart_sold_parts_by_region_with_date
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: mart_sold_parts_by_region_with_date_copilot
    tests:
      - no_order_after_today:
          column_name: date

  - name: stg_orders_copilot
    tests:
      - no_order_after_today:
          column_name: order_date

  - name: stg_tpch_orders
    tests:
      - no_order_after_today:
          column_name: order_date