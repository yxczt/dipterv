-- no order after today in a model with a date type column
--time to develop code: 50.23 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

{% test no_order_after_today(model) %}
    SELECT 
        *
    FROM 
        {{ model }}
    WHERE 
        order_date > CURRENT_DATE()
{% endtest %}
