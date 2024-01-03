{# -- item staging model
-- stg_main__item.sql

```sql
with source as (

    select * from {{ source('tpcds','item') }}

),

renamed as (

    select
        i_item_sk as item_sk,
        i_item_id as item_id,
        i_rec_start_date as rec_start_date,
        i_rec_end_date as rec_end_date,
        i_item_desc as item_desc,
        i_current_price as current_price,
        i_wholesale_cost as wholesale_cost,
        i_brand_id as brand_id,
        i_brand as brand,
        i_class_id as class_id,
        i_class as class,
        i_category_id as category_id,
        i_category as category,
        i_manufact_id as manufact_id,
        i_manufact as manufact,
        i_size as size,
        i_formulation as formulation,
        i_color as color,
        i_units as units,
        i_container as container,
        i_manager_id as manager_id,
        i_product_name as product_name
    from source

)

select * from renamed
```

-- stg_main__item.yml

```yaml
version: 2

models:
  - name: stg_main__item
    description: "The staging model for items."
    columns:
      - name: item_sk
        description: "The surrogate key for the item, primary key for the table."
        tests:
          - unique
          - not_null
      - name: item_id
        description: "The business key for the item."
      - name: rec_start_date
        description: "The record start date for the item."
      - name: rec_end_date
        description: "The record end date for the item."
      - name: item_desc
        description: "The description of the item."
      - name: current_price
        description: "The current retail price of the item."
      - name: wholesale_cost
        description: "The wholesale cost of the item."
      - name: brand_id
        description: "The identifier for the item's brand."
      - name: brand
        description: "The name of the item's brand."
      - name: class_id
        description: "The identifier for the item's class."
      - name: class
        description: "The name of the item's class."
      - name: category_id
        description: "The identifier for the item's category."
      - name: category
        description: "The name of the item's category."
      - name: manufact_id
        description: "The identifier for the item's manufacturer."
      - name: manufact
        description: "The name of the item's manufacturer."
      - name: size
        description: "The size of the item."
      - name: formulation
        description: "The formulation of the item."
      - name: color
        description: "The color of the item."
      - name: units
        description: "The unit quantity of the item."
      - name: container
        description: "The type of container for the item."
      - name: manager_id
        description: "The manager responsible for the item."
      - name: product_name
        description: "The name of the product/item."
```

-- store staging model
-- stg_store.sql

with source as (

    select * from {{ source('tpcds', 'store') }}

),

renamed as (

    select
        -- primary key
        s_store_sk as store_sk,
        
        -- strings
        s_store_id as store_id,
        s_store_name as store_name,
        s_number_employees as number_employees,
        s_floor_space as floor_space,
        s_hours as hours,
        s_manager as manager,
        s_market_id as market_id,
        s_geography_class as geography_class,
        s_market_desc as market_desc,
        s_market_manager as market_manager,
        s_division_id as division_id,
        s_division_name as division_name,
        s_company_id as company_id,
        s_company_name as company_name,
        s_street_number as street_number,
        s_street_name as street_name,
        s_street_type as street_type,
        s_suite_number as suite_number,
        s_city as city,
        s_county as county,
        s_state as state,
        s_zip as zip,
        s_country as country,
        s_gmt_offset as gmt_offset,
        s_tax_percentage as tax_percentage,
        s_rec_start_date as rec_start_date,
        s_rec_end_date as rec_end_date,
        s_closed_date_sk as closed_date_sk
        
    from source

)

select
    store_sk,
    store_id,
    store_name,
    number_employees,
    floor_space,
    hours,
    manager,
    market_id,
    geography_class,
    market_desc,
    market_manager,
    division_id,
    division_name,
    company_id,
    company_name,
    street_number,
    street_name,
    street_type,
    suite_number,
    city,
    county,
    state,
    zip,
    country,
    gmt_offset,
    tax_percentage,
    rec_start_date,
    rec_end_date,
    closed_date_sk
from renamed

-- stg_store.yml

version: 2

models:
  - name: stg_store
    description: "The staging model for store data."
    columns:
      - name: store_sk
        description: "Unique identifier for store, primary key of the table."
        tests:
          - unique
          - not_null
      - name: store_id
        description: "The store's identifier in human-readable format."
      - name: store_name
        description: "The name of the store."
      - name: number_employees
        description: "Number of employees working in the store."
      - name: floor_space
        description: "Floor space of the store in square units."
      - name: hours
        description: "Operating hours of the store."
      - name: manager
        description: "Manager of the store."
      - name: market_id
        description: "Market identifier where the store is located."
      - name: geography_class
        description: "Geographical classification of the store."
      - name: market_desc
        description: "Description of the market."
      - name: market_manager
        description: "Market manager of the store."
      - name: division_id
        description: "Division identifier where the store belongs."
      - name: division_name
        description: "Name of the division where the store belongs."
      - name: company_id
        description: "Company identifier where the store belongs."
      - name: company_name
        description: "Company name where the store belongs."
      - name: street_number
        description: "Street number of the store address."
      - name: street_name
        description: "Street name of the store address."
      - name: street_type
        description: "Street type of the store address."
      - name: suite_number
        description: "Suite number of the store address."
      - name: city
        description: "City where the store is located."
      - name: county
        description: "County where the store is located."
      - name: state
        description: "State where the store is located."
      - name: zip
        description: "ZIP code where the store is located."
      - name: country
        description: "Country where the store is located."
      - name: gmt_offset
        description: "GMT offset for the store's location."
      - name: tax_percentage
        description: "Tax percentage applicable at the store location."
      - name: rec_start_date
        description: "Start date of the store record."
      - name: rec_end_date
        description: "End date of the store record."
      - name: closed_date_sk
        description: "The surrogate key for the date on which the store was closed."


-- inventory
-- stg_main__inventory.sql

with source as (

    select * from {{ source('tpcds', 'inventory') }}

),

renamed as (

    select
        inv_date_sk as date_sk,
        inv_item_sk as item_sk,
        inv_warehouse_sk as warehouse_sk,
        inv_quantity_on_hand as quantity_on_hand

    from source

)

select * from renamed
```

-- stg_main__inventory.yml

```yaml
version: 2

models:
  - name: stg_main__inventory
    description: "The staging model for inventory."
    columns:
      - name: date_sk
        description: "The surrogate key for the date when the inventory record applies."
        tests:
          - not_null
          - unique
      - name: item_sk
        description: "The surrogate key of the item for which the inventory quantity is recorded."
        tests:
          - not_null
      - name: warehouse_sk
        description: "The surrogate key for the warehouse where the item is stored."
        tests:
          - not_null
      - name: quantity_on_hand
        description: "The quantity of items available in inventory on hand."
        tests:
          - not_null

-- tpch orders #}