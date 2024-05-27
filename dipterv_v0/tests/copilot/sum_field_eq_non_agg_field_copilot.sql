-- aggregated field in a model is equal to a non aggregated one
--time to develop code: 36.28 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0
{% test aggregated_field_eq_non_agg_field_copilot(model, agg_field, non_agg_field) %}
    SELECT 
        {{ model }}.{{ agg_field }},
        {{ model }}.{{ non_agg_field }}
    FROM 
        {{ model }}
    WHERE 
        {{ model }}.{{ agg_field }} != {{ model }}.{{ non_agg_field }};
{% endtest %}