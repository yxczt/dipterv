  - name: stg_tpch_customer
    description: "The staging model for TPCH customer data."
    columns:
      - name: customer_id
        description: "Unique identifier for a customer."
        tests:
          - unique
          - not_null
      - name: customer_name
        description: "Name of the customer."
        tests:
          - unique
          - not_null
      - name: customer_address
        description: "Address of the customer."
        tests:
          - unique
          - not_null
      - name: nation_id
        description: "Identifier for the nation the customer belongs to."
        tests:
          - not_null
      - name: customer_phone
        description: "Phone number of the customer."
        tests:
          - unique
          - not_null
      - name: account_balance
        description: "Account balance of the customer."
        tests:
          - not_null
      - name: market_segment
        description: "Market segment the customer belongs to."
        tests:
          - not_null
      - name: customer_comment
        description: "Comments about the customer."
        tests:
          - not_null