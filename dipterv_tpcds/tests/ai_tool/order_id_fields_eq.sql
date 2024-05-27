--test that a field in a table by order_id is the same as a field in another table by order_id
--time to develop code: 2 minute 4.97 seconds
--score: 0 * 1 + 0 * 2 + 0 * 10 = 0

--test that a field in a table by order_id is the same as a field in another table by order_id

-- tests/generic/test_field_match_by_order_id.sql
{% test test_field_match_by_order_id(model_a, model_b, field_a, field_b, order_id_field) %}

with model_a_data as (

    select
        {{ order_id_field }} as order_id,
        {{ field_a }} as field_value_a
    from {{ model_a }}

),

model_b_data as (

    select
        {{ order_id_field }} as order_id,
        {{ field_b }} as field_value_b
    from {{ model_b }}

),

mismatched_values as (

    select
        a.order_id,
        a.field_value_a,
        b.field_value_b
    from model_a_data a
    join model_b_data b
    on a.order_id = b.order_id
    where a.field_value_a <> b.field_value_b

)

select *
from mismatched_values

{% endtest %}