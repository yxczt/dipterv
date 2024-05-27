-- parts and suppliers aggregated by region
-- time to develop code: 1 minute 30.14 seconds
-- score: 0 * 1 + 1 * 2 + 0 * 10 = 2

-- int_parts_and_suppliers_by_region.sql

WITH parts_and_suppliers_by_region AS (
    SELECT
        r.region_id,
        ps.part_id,
        ps.supplier_id,
        COUNT(*) as count
    FROM 
        {{ ref('stg_tpch_partsupp') }} ps
    JOIN
        {{ ref('stg_tpch_supplier') }} s
    ON
        s.supplier_id = ps.supplier_id
    JOIN
        {{ ref('stg_tpch_nation') }} n
    ON
        n.nation_id = s.nation_id
    JOIN
        {{ ref('stg_tpch_region') }} r
    ON
        r.region_id = n.region_id
    GROUP BY 
        r.region_id, ps.part_id, ps.supplier_id
)

SELECT
    region_id,
    part_id,
    supplier_id,
    SUM(count) as total_count
FROM 
    parts_and_suppliers_by_region
GROUP BY 
    region_id, part_id, supplier_id