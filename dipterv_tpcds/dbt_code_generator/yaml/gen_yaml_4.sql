  - name: int_avg_revenue_per_customer_order
    columns:
      - name: customer_sk
        description: "Unique identifier for a customer."
        tests:
          - unique
          - not_null
      - name: avg_revenue_per_order
        description: "Average revenue generated per customer order."
        tests:
          - not_null