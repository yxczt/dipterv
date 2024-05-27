-- item sold by month
-- time to develop code: 1 minute 30.14 seconds
-- score: 0 * 1 + 0 * 2 + 0 * 10 = 0

-- item sold by month

with web_sales as (
    select
        ws_sold_date_sk,
        ws_item_sk,
        ws_quantity
    from {{ ref('stg_web_sales') }}
), date_dim as (
    select
        date_sk,
        year,
        month_seq
    from {{ ref('stg_tpcds_date_dim') }}
), item as (
    select
        item_sk,
        item_id,
        item_desc
    from {{ ref('stg_item') }}
), sales_by_date as (
    select
        ws.ws_item_sk,
        dd.year,
        dd.month_seq,
        sum(ws.ws_quantity) as total_quantity_sold
    from web_sales ws
    join date_dim dd on ws.ws_sold_date_sk = dd.date_sk
    group by ws.ws_item_sk, dd.year, dd.month_seq
), monthly_item_sales as (
    select
        s.year,
        s.month_seq,
        i.item_id,
        i.item_desc,
        s.total_quantity_sold
    from sales_by_date s
    join item i on s.ws_item_sk = i.item_sk
)

select * from monthly_item_sales