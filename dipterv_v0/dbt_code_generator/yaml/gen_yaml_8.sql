  - name: stg_customer
    columns:
      - name: customer_key
        description: "Unique key identifier for a customer."
        tests:
          - unique
          - not_null

      - name: customer_name
        description: "Name of the customer."
        tests:
          - unique
          - not_null

      - name: address
        description: "Address of the customer."
        tests:
          - unique
          - not_null

      - name: nation_key
        description: "Foreign key to the nation table."
        tests:
          - not_null
          - relationships:
              to: ref('stg_tpch_nation')
              field: nation_id

      - name: phone
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

      - name: comment
        description: "Comments about the customer."
        tests:
          - not_null