  - name: int_lineitem_revenue
    columns:
      - name: order_id
        description: "Unique identifier for each order."
        tests:
          - unique
          - not_null
      - name: customer_id
        description: "Unique identifier for each customer."
        tests:
          - not_null
      - name: customer_name
        description: "Name of the customer."
        tests:
          - not_null
      - name: market_segment
        description: "Market segment the customer belongs to."
        tests:
          - not_null
      - name: part_id
        description: "Unique identifier for each part."
        tests:
          - not_null
      - name: part_name
        description: "Name of the part."
        tests:
          - not_null
      - name: supplier_id
        description: "Unique identifier for each supplier."
        tests:
          - not_null
      - name: supplier_name
        description: "Name of the supplier."
        tests:
          - not_null
      - name: total_revenue
        description: "Total revenue generated from the line item."
        tests:
          - not_null