  - name: mart_customer_data
    description: "Model for customer data in the mart layer."
    columns:
      - name: nation
        description: "Nation identifier as varchar."
        tests:
          - not_null
      - name: year
        description: "Year of the transaction."
        tests:
          - not_null
      - name: month
        description: "Month of the transaction."
        tests:
          - not_null
      - name: day
        description: "Day of the transaction."
        tests:
          - not_null
      - name: i_category
        description: "Item category."
        tests:
          - not_null
      - name: i_class
        description: "Item class."
        tests:
          - not_null
      - name: i_brand
        description: "Item brand."
        tests:
          - not_null
      - name: total_quantity
        description: "Total quantity of items."
        tests:
          - not_null
      - name: total_net_paid
        description: "Total net paid amount."
        tests:
          - not_null
      - name: total_net_paid_inc_tax
        description: "Total net paid including tax."
        tests:
          - not_null
      - name: total_net_paid_inc_ship
        description: "Total net paid including shipping."
        tests:
          - not_null
      - name: total_net_paid_inc_ship_tax
        description: "Total net paid including shipping and tax."
        tests:
          - not_null
      - name: city
        description: "City of the transaction."
      - name: state
        description: "State of the transaction."
      - name: country
        description: "Country of the transaction."
      - name: max_revenue
        description: "Maximum revenue from a customer."