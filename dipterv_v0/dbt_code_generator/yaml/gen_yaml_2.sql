  - name: stg_tpch_region
    description: "Staging model for TPCH region data."
    columns:
      - name: region_id
        description: "Unique identifier for a region."
        tests:
          - unique
          - not_null
      - name: region_name
        description: "Name of the region."
        tests:
          - unique
          - not_null
      - name: region_comment
        description: "Comments about the region."
        tests:
          - unique
          - not_null