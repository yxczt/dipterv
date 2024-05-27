  - name: int_lineitem_sold_per_customer
    columns:
      - name: customer_id
        description: "Unique identifier for customers."
        tests:
          - unique
          - not_null
      - name: ws_order_number
        description: "Web sales order number."
        tests:
          - unique
          - not_null
      - name: item_id
        description: "Unique identifier for items."
        tests:
          - not_null
      - name: item_desc
        description: "Description of the item."
      - name: brand
        description: "Brand of the item."
      - name: class
        description: "Class category of the item."
      - name: category
        description: "Category of the item."
      - name: date
        description: "Date of the sale."
        tests:
          - not_null
      - name: ws_quantity
        description: "Quantity of items sold in the web sale."
        tests:
          - not_null
      - name: ws_wholesale_cost
        description: "Wholesale cost of the item in the web sale."
        tests:
          - not_null
      - name: ws_sales_price
        description: "Sales price of the item in the web sale."
        tests:
          - not_null