  - name: int_lineitem_revenue
    description: "Stores revenue information by region."
    columns:
      - name: region_id
        description: "The unique identifier for a region."
        tests:
          - not_null
          - unique
          - relationships:
              to: ref('int_regions_and_nations')
              field: region_id

      - name: region_name
        description: "The name of the region."
        tests:
          - not_null
          - unique
          - accepted_values:
              values: ['AFRICA', 'MIDDLE EAST', 'ASIA']
              config:
                severity: warn

      - name: max_revenue_in_region
        description: "The maximum revenue generated in a region."
        tests:
          - not_null