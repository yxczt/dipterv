  - name: stg_item
    description: "Staging model for item data."
    columns:
      - name: item_sk
        description: "Unique identifier for each item."
        tests:
          - unique
          - not_null
      - name: item_id
        description: "Item ID."
        tests:
          - unique
          - not_null
      - name: rec_start_date
        description: "Record start date."
        tests:
          - not_null
      - name: rec_end_date
        description: "Record end date."
      - name: item_desc
        description: "Description of the item."
      - name: current_price
        description: "Current price of the item."
      - name: wholesale_cost
        description: "Wholesale cost of the item."
      - name: brand_id
        description: "Identifier for the brand."
        tests:
          - not_null
      - name: brand
        description: "Name of the brand."
      - name: class_id
        description: "Identifier for the item class."
        tests:
          - not_null
      - name: class
        description: "Name of the item class."
      - name: category_id
        description: "Identifier for the item category."
        tests:
          - not_null
      - name: category
        description: "Name of the item category."
      - name: manufact_id
        description: "Identifier for the manufacturer."
        tests:
          - not_null
      - name: manufact
        description: "Name of the manufacturer."
      - name: size
        description: "Size of the item."
      - name: formulation
        description: "Formulation of the item."
      - name: color
        description: "Color of the item."
      - name: units
        description: "Units in which the item is measured."
      - name: container
        description: "Type of container in which the item is packaged."
      - name: manager_id
        description: "Identifier for the managing personnel."
        tests:
          - not_null
      - name: product_name
        description: "Name of the product."
        tests:
          - not_null