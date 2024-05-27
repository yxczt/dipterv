-- staging model for tpch part
--time to develop code: 48.70 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- stg_part_copilot.sql

SELECT
    p.partkey AS part_id,
    p.name AS part_name,
    p.mfgr AS manufacturer,
    p.brand AS brand,
    p.type AS type,
    p.size AS size,
    p.container AS container,
    p.retailprice AS retail_price,
    p.comment AS comment
FROM 
    {{ source('tpch', 'tpch_part') }} AS p