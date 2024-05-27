--test that a field in a table by order_id is the same as a field in another table by order_id
--time to develop code: 25.82 seconds
--score: 0 * 1 + 1 * 2 + 0 * 10 = 2

{% test order_id_fields_eq_copilot(model, field1, table2, field2) %}
    SELECT 
        {{ model }}.order_id
    FROM 
        {{ model }}
    LEFT JOIN 
        {{ table2 }}
    ON 
        {{ model }}.order_id = {{ table2 }}.order_id
    WHERE 
        {{ model }}.{{ field1 }} != {{ table2 }}.{{ field2 }} OR
        {{ table2 }}.{{ field2 }} IS NULL;
{% endtest %}