```sql
{% test ensure_order_value_consistency(mart_orders_model, int_orders_aggregated_model) %}

with mart_orders_zero as (
    select
        order_id
    from {{ mart_orders_model }}
    where total_order_value = 0
),

int_orders_aggregated_non_zero as (
    select
        order_id
    from {{ int_orders_aggregated_model }}
    where total_order_value != 0
)

select
    mo.order_id
from mart_orders_zero mo
join int_orders_aggregated_non_zero ioa
on mo.order_id = ioa.order_id

{% endtest %}
```