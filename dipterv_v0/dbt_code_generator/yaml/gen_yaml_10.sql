  - name: stg_orders
    description: "Staging model for orders."
    columns:
      - name: order_key
        description: "Unique identifier for each order."
        tests:
          - unique
          - not_null
      - name: customer_key
        description: "Foreign key to customers."
        tests:
          - not_null
          - relationships:
              to: ref('stg_customer')
              field: customer_key
      - name: order_status
        description: "The status of the order."
        tests:
          - not_null
          - accepted_values:
              values: ['F', 'P', 'O']
              config:
                severity: warn
      - name: total_price
        description: "The total price of the order."
        tests:
          - not_null
      - name: order_date
        description: "The date when the order was placed."
        tests:
          - not_null
      - name: order_priority
        description: "Priority of the order."
        tests:
          - not_null
          - accepted_values:
              values: ['1-URGENT', '2-HIGH', '3-MEDIUM', '4-NOT SPECIFIED', '5-LOW']
              config:
                severity: warn
      - name: ship_priority
        description: "Shipping priority of the order."
        tests:
          - not_null
      - name: clerk
        description: "The clerk who processed the order."
        tests:
          - not_null
      - name: comment
        description: "Comments about the order."
        tests:
          - not_null