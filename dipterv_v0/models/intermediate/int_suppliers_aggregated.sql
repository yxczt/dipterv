with suppliers as (
    select
        supplier_id,
        supplier_name,
        supplier_address,
        nation_id,
        supplier_phone,
        account_balance,
        supplier_comment
    from {{ ref('stg_tpch_supplier') }}
),

nations as (
    select
        nation_id,
        nation_name,
        region_id
    from {{ ref('stg_tpch_nation') }}
),

suppliers_enriched as (
    select
        s.supplier_id,
        s.supplier_name,
        s.supplier_address,
        s.supplier_phone,
        s.account_balance,
        s.supplier_comment,
        n.nation_name
    from suppliers s
    left join nations n 
        on s.nation_id = n.nation_id
)

select * from suppliers_enriched