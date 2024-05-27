-- no order after today in a model with a date type column
--time to develop code: 1 minute 44.31 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

--tests/generic/test_no_order_after_today.sql
{% test no_order_after_today(model, column_name) %}

    select
        {{ column_name }}

    from {{ model }}

    where {{ column_name }} > current_date()

{% endtest %}