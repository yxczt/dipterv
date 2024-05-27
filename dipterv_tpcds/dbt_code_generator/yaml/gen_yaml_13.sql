  - name: mart_sold_items_by_region_with_date
    description: "This model provides the sold items by region with date and includes revenue information."
    columns:
      - name: region
        description: "The region identifier where the items were sold."
        tests:
          - not_null
          - unique

      - name: customer_id
        description: "The customer identifier for the sold items."
        tests:
          - not_null
          - unique

      - name: lineitems_bought
        description: "The total number of line items bought by the customer."
        tests:
          - not_null

      - name: max_revenue_per_customer
        description: "The maximum revenue generated per customer."
        tests:
          - not_null