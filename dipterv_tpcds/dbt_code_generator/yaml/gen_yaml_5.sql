  - name: int_item_sold_by_month
    columns:
      - name: year
        description: "The year when the item was sold."
        tests:
          - not_null
      - name: month_seq
        description: "Sequential identifier for the month within the dataset's timeline."
        tests:
          - not_null
      - name: item_id
        description: "Unique identifier of the item."
        tests:
          - not_null
          - unique
      - name: item_desc
        description: "Description of the item."
        tests:
          - not_null
      - name: total_quantity_sold
        description: "The total quantity of the item sold."
        tests:
          - not_null