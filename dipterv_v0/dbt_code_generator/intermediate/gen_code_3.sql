with suppliers as (
    select * from {{ ref('stg_tpch_supplier') }}
),
parts as (
    select * from {{ ref('stg_tpch_part') }}
),
nations as (
    select * from {{ ref('stg_tpch_nation') }}
),
regions as (
    select * from {{ ref('stg_tpch_region') }}
),
suppliers_enriched as (
    select 
        s.supplier_id,
        s.supplier_name,
        s.supplier_address,
        s.supplier_phone,
        s.account_balance,
        n.nation_name,
        n.region_id
    from suppliers s
    join nations n on s.nation_id = n.nation_id
),
parts_aggregated as (
    select
        p.part_id,
        p.brand,
        p.size,
        n.region_id,
        count(distinct p.part_id) as total_parts,
        count(distinct p.brand) as unique_brands_count,
        avg(p.size) as average_part_size
    from parts p
    join nations n on p.part_id = n.nation_id
    group by n.region_id
),
suppliers_aggregated as (
    select
        se.region_id,
        count(distinct se.supplier_id) as total_suppliers,
        avg(se.account_balance) as average_account_balance
    from suppliers_enriched se
    group by se.region_id
),
aggregated_by_region as (
    select
        r.region_id,
        r.region_name,
        coalesce(pa.total_parts, 0) as total_parts,
        coalesce(sa.total_suppliers, 0) as total_suppliers,
        coalesce(sa.average_account_balance, 0) as average_account_balance,
        coalesce(pa.unique_brands_count, 0) as unique_brands_count,
        coalesce(pa.average_part_size, 0) as average_part_size
    from regions r
    left join parts_aggregated pa on r.region_id = pa.region_id
    left join suppliers_aggregated sa on r.region_id = sa.region_id
)

select * from aggregated_by_region