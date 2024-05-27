  - name: mart_order_revenue
    columns:
      - name: city
        description: "The city where the order was placed."
        tests:
          - unique
      - name: state
        description: "The state where the order was placed."
        tests:
          - unique
      - name: country
        description: "The country where the order was placed."
        tests:
          - unique
      - name: max_revenue
        description: "The maximum revenue generated from an order."
        tests:
          - unique
      - name: nation
        description: "The nation where the order was placed."
        tests:
          - unique
      - name: year
        description: "The year when the order was placed."
        tests:
          - unique
      - name: month
        description: "The month when the order was placed."
        tests:
          - unique
      - name: day
        description: "The day when the order was placed."
        tests:
          - unique
      - name: i_category
        description: "The category of the item ordered."
        tests:
          - unique
      - name: i_class
        description: "The class of the item ordered."
        tests:
          - unique
      - name: i_brand
        description: "The brand of the item ordered."
        tests:
          - unique
      - name: total_quantity
        description: "The total quantity of items ordered."
        tests:
          - unique
      - name: total_net_paid
        description: "The total net amount paid for the order."
        tests:
          - unique
      - name: total_net_paid_inc_tax
        description: "The total net amount paid including tax for the order."
        tests:
          - unique
      - name: total_net_paid_inc_ship
        description: "The total net amount paid including shipping for the order."
        tests:
          - unique
      - name: total_net_paid_inc_ship_tax
        description: "The total net amount paid including shipping and tax for the order."
        tests:
          - unique