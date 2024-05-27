  - name: mart_order_revenue
    description: "A model containing aggregated revenue data for orders."
    columns:
      - name: city
        description: "The city associated with the order."
        tests:
          - not_null

      - name: state
        description: "The state associated with the order."
        tests:
          - not_null

      - name: country
        description: "The country associated with the order."
        tests:
          - not_null

      - name: max_revenue
        description: "The maximum revenue generated from an order."
        tests:
          - not_null

      - name: nation
        description: "The nation associated with the order."
        tests:
          - not_null

      - name: year
        description: "The year in which the order was placed."
        tests:
          - not_null

      - name: month
        description: "The month in which the order was placed."
        tests:
          - not_null

      - name: day
        description: "The day of the month on which the order was placed."
        tests:
          - not_null

      - name: i_category
        description: "The category of the item ordered."
        tests:
          - not_null

      - name: i_class
        description: "The class of the item ordered."
        tests:
          - not_null

      - name: i_brand
        description: "The brand of the item ordered."
        tests:
          - not_null

      - name: total_quantity
        description: "The total quantity of items ordered."
        tests:
          - not_null

      - name: total_net_paid
        description: "The total net amount paid for the order."
        tests:
          - not_null

      - name: total_net_paid_inc_tax
        description: "The total net amount paid for the order, including taxes."
        tests:
          - not_null

      - name: total_net_paid_inc_ship
        description: "The total net amount paid for the order, including shipping costs."
        tests:
          - not_null

      - name: total_net_paid_inc_ship_tax
        description: "The total net amount paid for the order, including shipping costs and taxes."
        tests:
          - not_null