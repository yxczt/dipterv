{%- for node in graph.nodes.values() -%}
    -- depends_on: {{ref(node.name)}}
{% endfor %}
{%- set relations = [] -%}
with
{% for node in graph.nodes.values() %}
    {%- do relations.append(ref(node.name)) -%}
{% endfor %}
{% for relation in relations %}
    {{relation.schema}}_{{relation.identifier}}_resource_data as (
        select * from {{ relation }}
    ),
    {% set information_schema_columns = run_query(dbt_profiler.select_from_information_schema_columns(relation)) %}
    {% set information_schema_columns = information_schema_columns.rename(information_schema_columns.column_names | map('lower')) %}
    {% set information_schema_data_types = information_schema_columns.columns['data_type'].values() | map('lower') | list %}
    {% set information_schema_column_names = information_schema_columns.columns['column_name'].values() | map('lower') | list %}
    {% set data_type_map = {} %}
    {% for column_name in information_schema_column_names %}
        {% do data_type_map.update({column_name: information_schema_data_types[loop.index-1]}) %}
    {% endfor %}
    {% set column_list = adapter.get_columns_in_relation(relation) %}
    {% set column_name_list = column_list | map(attribute="name") | list %}
    {% for column_name in column_name_list %}
        {{relation.schema}}_{{relation.identifier}}_{{column_name}}_data as (
        {% set data_type = data_type_map.get(column_name.lower(), "") %}
        select
            '{{relation.schema}}.{{relation.identifier}}' as resource,
            '{{ column_name }}' as column_name,
            nullif('{{ data_type }}', '') as data_type,
            {{ dbt_profiler.measure_row_count(column_name, data_type) }} as row_count,
            {{ dbt_profiler.measure_not_null_proportion(column_name, data_type) }} as not_null_proportion,
            {{ dbt_profiler.measure_distinct_proportion(column_name, data_type) }} as distinct_proportion,
            {{ dbt_profiler.measure_distinct_count(column_name, data_type) }} as distinct_count,
            {{ dbt_profiler.measure_is_unique(column_name, data_type) }} as is_unique,
            cast(min({{ adapter.quote(column_name) }}) as {{ dbt_profiler.type_string() }}) as min,
            cast(max({{ adapter.quote(column_name) }}) as {{ dbt_profiler.type_string() }}) as max,
            {{ dbt_profiler.measure_avg(column_name, data_type) }} as avg,
            cast(median({{ adapter.quote(column_name) }}) as {{ dbt_profiler.type_string() }}) as median,
            {{ dbt_profiler.measure_std_dev_population(column_name, data_type) }} as std_dev_population,
            {{ dbt_profiler.measure_std_dev_sample(column_name, data_type) }} as std_dev_sample,
            cast(current_timestamp as {{ dbt_profiler.type_string() }}) as profiled_at
        from {{relation.schema}}_{{relation.identifier}}_resource_data
        ){% if not loop.last %},{% endif %}

    {% endfor %}
    {% if not loop.last %},{% endif %}
{% endfor %}

{% for relation in relations %}
    {% set column_list = adapter.get_columns_in_relation(relation) %}
    {% set column_name_list = column_list | map(attribute="name") | list %}
    {% for column_name in column_name_list %}
        select * from {{relation.schema}}_{{relation.identifier}}_{{column_name}}_data
        {% if not loop.last %}union all{% endif %}

    {% endfor %}
    {% if not loop.last %}union all{% endif %}
{% endfor %}