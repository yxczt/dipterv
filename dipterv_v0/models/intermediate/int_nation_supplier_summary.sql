-- intermediate_nation_supplier_summary.sql

with supplier_info as (
    select
        SUPPKEY as supplier_id,
        NAME as supplier_name,
        ADDRESS as supplier_address,
        PHONE as supplier_phone,
        COMMENT as supplier_comment,
        NATIONKEY as nation_id
    from {{ ref('stg_tpch_supplier') }}
),

nation_info as (
    select
        NATIONKEY as nation_id,
        NAME as nation_name,
        REGIONKEY as region_id,
        COMMENT as nation_comment
    from {{ ref('stg_tpch_nation') }}
),

nation_supplier_summary as (
    select
        ni.nation_id,
        ni.nation_name,
        count(distinct si.supplier_id) as total_suppliers,
        avg(length(si.supplier_name)) as avg_supplier_name_length,
        max(length(si.supplier_address)) as max_supplier_address_length,
        min(length(si.supplier_phone)) as min_supplier_phone_length,
        count(distinct si.supplier_address) as distinct_supplier_addresses,
        count(distinct si.supplier_phone) as distinct_supplier_phones
    from supplier_info si
    join nation_info ni on si.nation_id = ni.nation_id
    group by ni.nation_id, ni.nation_name
)

select * from nation_supplier_summary
