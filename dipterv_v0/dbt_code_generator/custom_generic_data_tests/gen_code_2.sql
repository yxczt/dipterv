--tests/generic/test_aggregated_equals_non_aggregated.sql
{% test aggregated_equals_non_aggregated(model) %}

with aggregated_data as (
    select
        customer_id,
        sum(total_revenue) as total_revenue_sum
    from {{ model }}
    group by customer_id
)

select
    a.customer_id
from {{ model }} as m
join aggregated_data as a
on m.customer_id = a.customer_id
where m.total_revenue != a.total_revenue_sum

{% endtest %}