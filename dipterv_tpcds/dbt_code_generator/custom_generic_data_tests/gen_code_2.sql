```sql
{% test test_aggregated_equals_non_aggregated(mart_customer_data_copilot, total_customers, distinct_salutations) %}

with validation as (

    select
        total_customers,
        distinct_salutations
        
    from {{ ref('mart_customer_data_copilot') }}

)

select *
from validation
where total_customers != distinct_salutations

{% endtest %}
```

```sql
{% test test_aggregated_equals_non_aggregated(mart_order_revenue_copilot, total_revenue, max_revenue_per_customer) %}

with validation as (

    select
        total_revenue,
        max_revenue_per_customer
        
    from {{ ref('mart_order_revenue_copilot') }}

)

select *
from validation
where total_revenue != max_revenue_per_customer

{% endtest %}
```

```sql
{% test test_aggregated_equals_non_aggregated(mart_sold_items_by_region_with_date_copilot, items_sold, region) %}

with validation as (

    select
        items_sold,
        region
        
    from {{ ref('mart_sold_items_by_region_with_date_copilot') }}

)

select *
from validation
where items_sold != region

{% endtest %}
```