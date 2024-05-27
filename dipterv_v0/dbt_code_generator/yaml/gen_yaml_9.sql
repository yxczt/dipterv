  - name: stg_part
    columns:
      - name: part_key
        description: "Unique identifier for a part."
        tests:
          - unique
          - not_null
      - name: name
        description: "Name of the part."
        tests:
          - unique
          - not_null
      - name: manufacturer
        description: "Manufacturer of the part."
        tests:
          - not_null
      - name: brand
        description: "Brand of the part."
        tests:
          - not_null
      - name: type
        description: "Type category of the part."
        tests:
          - not_null
      - name: size
        description: "Size of the part."
        tests:
          - not_null
      - name: container
        description: "Type of container for the part."
        tests:
          - not_null
      - name: retail_price
        description: "Retail price of the part."
        tests:
          - not_null
      - name: comment
        description: "Additional comments regarding the part."
        tests:
          - not_null