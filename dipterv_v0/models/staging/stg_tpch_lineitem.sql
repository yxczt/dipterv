-- stg_tpch_lineitem.sql

with source as (
    select
        ORDERKEY as order_id,
        PARTKEY as part_id,
        SUPPKEY as supplier_id,
        LINENUMBER as line_number,
        QUANTITY as quantity,
        EXTENDEDPRICE as extended_price,
        DISCOUNT as discount,
        TAX as tax,
        RETURNFLAG as return_flag,
        LINESTATUS as line_status,
        SHIPDATE as ship_date,
        COMMITDATE as commit_date,
        RECEIPTDATE as receipt_date,
        SHIPINSTRUCT as ship_instruct,
        SHIPMODE as ship_mode,
        COMMENT as line_comment
    from {{ source('tpch', 'tpch_lineitem') }}
)

select * from source
