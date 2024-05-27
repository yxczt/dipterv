  - name: int_lineitem_sold_per_customer
    columns:
      - name: customer_id
        description: "Unique identifier for the customer."
        tests:
          - unique
          - not_null
      - name: customer_name
        description: "Name of the customer."
        tests:
          - unique
          - not_null
      - name: order_id
        description: "Unique identifier for the order."
        tests:
          - unique
          - not_null
      - name: part_id
        description: "Unique identifier for the part."
        tests:
          - not_null
      - name: quantity
        description: "The quantity of the part ordered."
        tests:
          - not_null
      - name: extended_price
        description: "The extended price of the part ordered."
        tests:
          - not_null
      - name: discount
        description: "The discount applied to the part ordered."
        tests:
          - not_null
      - name: tax
        description: "The tax applied to the part ordered."
        tests:
          - not_null