  - name: stg_customer
    description: "Staging model for customer data."
    columns:
      - name: customer_sk
        description: "Unique identifier for a customer."
        tests:
          - unique
          - not_null
      - name: customer_id
        description: "Customer ID."
        tests:
          - unique
          - not_null
      - name: current_cdemo_sk
        description: "Current demographic snapshot key of the customer."
      - name: current_hdemo_sk
        description: "Current household demographic snapshot key of the customer."
      - name: current_addr_sk
        description: "Current address key of the customer."
        tests:
          - not_null
      - name: first_shipto_date_sk
        description: "Date key for the first shipment to the customer."
      - name: first_sales_date_sk
        description: "Date key for the first sale to the customer."
      - name: salutation
        description: "Salutation of the customer."
      - name: first_name
        description: "First name of the customer."
      - name: last_name
        description: "Last name of the customer."
      - name: preferred_cust_flag
        description: "Flag indicating if the customer is a preferred customer."
      - name: birth_day
        description: "Birth day of the customer."
      - name: birth_month
        description: "Birth month of the customer."
      - name: birth_year
        description: "Birth year of the customer."
      - name: birth_country
        description: "Country of birth of the customer."
      - name: login
        description: "Login information of the customer."
      - name: email_address
        description: "Email address of the customer."
        tests:
          - not_null
      - name: last_review_date_sk
        description: "Date key for the last review made by the customer."