- name: int_avg_revenue_per_customer_order
  description: "Intermediate model that aggregates revenue data at the customer level, calculating the average revenue generated per order."
  columns:
    - name: customer_id
      description: "Unique identifier for each customer."
      tests:
        - not_null
        - unique
    - name: customer_name
      description: "The name of the customer."
      tests:
        - not_null
    - name: total_orders
      description: "The total number of orders placed by the customer."
      tests:
        - not_null
    - name: total_revenue
      description: "The total revenue generated from the customer."
      tests:
        - not_null
    - name: avg_revenue_per_order
      description: "The average revenue generated per order for the customer."
      tests:
        - not_null