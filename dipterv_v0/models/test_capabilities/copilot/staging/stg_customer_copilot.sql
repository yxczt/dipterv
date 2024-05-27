-- staging model for tpch customer
--time to develop code: 16.35 seconds
--score: 1 * 1 + 0 * 2 + 0 * 10 = 1

-- stg_customer_copilot.sql

SELECT
    c.custkey AS customer_id,
    c.name AS name,
    c.address AS address,
    c.nationkey AS nation_id,
    c.phone AS phone,
    c.acctbal AS account_balance,
    c.mktsegment AS market_segment,
    c.comment AS comment
FROM 
    {{ source('tpch', 'tpch_customer') }} AS c