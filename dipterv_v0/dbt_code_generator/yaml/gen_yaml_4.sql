  - name: int_avg_revenue_per_customer_order
    columns:
      - name: customer_id
        description: "Unique identifier for a customer."
        tests:
          - unique
          - not_null
          - relationships:
              to: ref('stg_tpch_customer')
              field: customer_key

      - name: customer_name
        description: "Name of the customer."
        tests:
          - not_null

      - name: avg_revenue_per_order
        description: "Average revenue generated per order by a customer."
        tests:
          - not_null