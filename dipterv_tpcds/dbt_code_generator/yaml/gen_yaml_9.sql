  - name: mart_customer_data
    columns:
      - name: customer_id
        description: "Unique identifier of a customer."
        tests:
          - unique
          - not_null
      - name: first_name
        description: "The first name of the customer."
        tests:
          - not_null
      - name: last_name
        description: "The last name of the customer."
        tests:
          - not_null
      - name: email_address
        description: "The email address of the customer."
        tests:
          - not_null
      - name: preferred_cust_flag
        description: "Flag indicating if the customer is a preferred customer."
        tests:
          - accepted_values:
              values: ['N', 'Y']
              config:
                severity: warn
      - name: birth_day
        description: "The birth day of the customer."
        tests:
          - not_null
      - name: birth_month
        description: "The birth month of the customer."
        tests:
          - not_null
      - name: birth_year
        description: "The birth year of the customer."
        tests:
          - not_null
      - name: birth_country
        description: "The country where the customer was born."
        tests:
          - not_null
      - name: login
        description: "Login details of the customer."
      - name: last_review_date_sk
        description: "The surrogate key for the date of the last review made by the customer."
        tests:
          - not_null