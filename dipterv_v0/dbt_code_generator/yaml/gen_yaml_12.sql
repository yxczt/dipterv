  - name: mart_order_revenue
    columns:
      - name: order_id
        description: "Unique identifier of an order."
        tests:
          - unique
          - not_null
      - name: customer_id
        description: "Identifier of the customer who placed the order."
        tests:
          - not_null
      - name: order_status
        description: "Status of the order."
        tests:
          - not_null
          - accepted_values:
              values: ['F', 'P', 'O']
              config:
                severity: warn
      - name: total_price
        description: "Total price of the order."
        tests:
          - not_null
      - name: order_date
        description: "Date when the order was placed."
        tests:
          - not_null
      - name: order_priority
        description: "Priority of the order."
        tests:
          - not_null
          - accepted_values:
              values: ['1-URGENT', '5-LOW', '3-MEDIUM']
              config:
                severity: warn
      - name: ship_priority
        description: "Shipping priority of the order."
        tests:
          - not_null
          - accepted_values:
              values: ['Clerk#000000001', 'Clerk#000001000', 'Clerk#000000501']
              config:
                severity: warn
      - name: clerk
        description: "Identifier of the clerk who processed the order."
        tests:
          - not_null
      - name: order_comment
        description: "Comment about the order."
        tests:
          - not_null
      - name: customer_name
        description: "Name of the customer who placed the order."
        tests:
          - not_null
      - name: nation_name
        description: "Name of the nation of the customer."
        tests:
          - not_null
          - accepted_values:
              values: ['ALGERIA', 'VIETNAM', 'IRAQ']
              config:
                severity: warn
      - name: region_id
        description: "Identifier of the region of the customer."
        tests:
          - not_null