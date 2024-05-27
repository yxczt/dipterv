  - name: mart_sold_parts_by_region_with_date
    columns:
      - name: order_id
        tests:
          - unique
      - name: customer_id
      - name: order_status
        tests:
          - accepted_values:
              values: ['F', 'P', 'O']
              config:
                severity: warn
      - name: total_price
      - name: order_date
      - name: order_priority
        tests:
          - accepted_values:
              values: ['1-URGENT', '5-LOW', '3-MEDIUM']
              config:
                severity: warn
      - name: part_id
      - name: part_name
      - name: manufacturer
        tests:
          - accepted_values:
              values: ['Manufacturer#1', 'Manufacturer#5', 'Manufacturer#3']
              config:
                severity: warn
      - name: brand
      - name: size
      - name: container
      - name: quantity
      - name: extended_price
      - name: discount
      - name: total_order_value
      - name: avg_item_value
      - name: earliest_order_date
      - name: latest_order_date
      - name: unique_parts_ordered
      - name: total_quantity_ordered
      - name: avg_price_per_part
      - name: min_price_per_part
      - name: max_price_per_part
      - name: nation_id
      - name: nation_name
      - name: region_id
      - name: region_name
        tests:
          - accepted_values:
              values: ['AFRICA', 'MIDDLE EAST', 'EUROPE', 'ASIA']
              config:
                severity: warn
      - name: region_comment