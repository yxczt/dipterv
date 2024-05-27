--tests/generic/test_no_order_after_today.sql
{% test no_order_after_today(model, column_name) %}

    select
        {{ column_name }}

    from {{ model }}

    where {{ column_name }} > current_date

{% endtest %}