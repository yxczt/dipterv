  - name: int_lineitem_revenue
    description: "Intermediate model for line item revenue."
    columns:
      - name: city
        description: "City associated with the revenue."
        tests:
          - not_null
      - name: state
        description: "State associated with the revenue."
        tests:
          - not_null
      - name: country
        description: "Country associated with the revenue."
        tests:
          - not_null
      - name: max_revenue
        description: "Maximum revenue from line items."
        tests:
          - not_null