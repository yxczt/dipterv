  - name: int_ordering_habits_per_nation
    description: "Intermediate model for analyzing ordering habits per nation."
    columns:
      - name: nation
        description: "Identifier for the nation."
        tests:
          - not_null
          - unique
      - name: year
        description: "The year of the order."
        tests:
          - not_null
      - name: month
        description: "The month of the order."
        tests:
          - not_null
      - name: day
        description: "The day of the order."
        tests:
          - not_null
      - name: i_category
        description: "Category of the item."
        tests:
          - not_null
      - name: i_class
        description: "Class of the item."
        tests:
          - not_null
      - name: i_brand
        description: "Brand of the item."
        tests:
          - not_null
      - name: total_quantity
        description: "Total quantity of items ordered."
        tests:
          - not_null
      - name: total_net_paid
        description: "Total net paid for the orders."
        tests:
          - not_null
      - name: total_net_paid_inc_tax
        description: "Total net paid including tax for the orders."
        tests:
          - not_null
      - name: total_net_paid_inc_ship
        description: "Total net paid including shipping for the orders."
        tests:
          - not_null
      - name: total_net_paid_inc_ship_tax
        description: "Total net paid including shipping and tax for the orders."
        tests:
          - not_null