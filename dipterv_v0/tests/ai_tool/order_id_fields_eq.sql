--test that a field in a table by order_id is the same as a field in another table by order_id
--time to develop code: 1 minute 32.54 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

{% test field_value_match_by_order_id(model_a, model_b, field_name) %}

with model_a_data as (
    select
        order_id,
        {{ field_name }} as field_value
    from {{ model_a }}
),

model_b_data as (
    select
        order_id,
        {{ field_name }} as field_value
    from {{ model_b }}
),

validation_errors as (
    select
        a.order_id,
        a.field_value as model_a_field_value,
        b.field_value as model_b_field_value
    from model_a_data a
    join model_b_data b
    on a.order_id = b.order_id
    where a.field_value != b.field_value
)

select *
from validation_errors

{% endtest %}
