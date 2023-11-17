with suppliers as (
    select * from {{ ref('stg_tpch_supplier') }}
),

nations as (
    select * from {{ ref('stg_tpch_nation') }}
),

suppliers_enriched as (
    select
        s.supplier_id,
        s.supplier_name,
        s.supplier_address,
        s.nation_id,
        s.supplier_phone,
        s.account_balance,
        s.supplier_comment,
        n.nation_name,
        n.region_id
    from suppliers s
    left join nations n on s.nation_id = n.nation_id
)

select * from suppliers_enriched