  - name: mart_customer_data
    columns:
      - name: customer_id
        description: "Unique identifier for a customer."
        tests:
          - unique
          - not_null
      - name: customer_name
        description: "Name of the customer."
        tests:
          - not_null
      - name: customer_address
        description: "Address of the customer."
        tests:
          - not_null
      - name: nation_id
        description: "Identifier for the nation of the customer."
        tests:
          - not_null
      - name: customer_phone
        description: "Phone number of the customer."
        tests:
          - not_null
      - name: account_balance
        description: "Account balance of the customer."
        tests:
          - not_null
      - name: market_segment
        description: "Market segment of the customer."
        tests:
          - not_null
      - name: customer_comment
        description: "Comments associated with the customer."
        tests:
          - not_null
      - name: nation_name
        description: "Name of the nation of the customer."
        tests:
          - not_null
      - name: region_id
        description: "Identifier for the region of the customer."
        tests:
          - not_null
      - name: region_name
        description: "Name of the region of the customer."
        tests:
          - not_null