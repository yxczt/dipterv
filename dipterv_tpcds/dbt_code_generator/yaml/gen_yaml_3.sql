  - name: stg_web_sales
    description: "Staging model for web sales."
    columns:
      - name: ws_sold_date_sk
        description: "The surrogate key for the sale date."
        tests:
          - not_null
      - name: ws_sold_time_sk
        description: "The surrogate key for the sale time."
        tests:
          - not_null
      - name: ws_ship_date_sk
        description: "The surrogate key for the ship date."
        tests:
          - not_null
      - name: ws_item_sk
        description: "The surrogate key for the item sold."
        tests:
          - not_null
      - name: ws_bill_customer_sk
        description: "The surrogate key for the billing customer."
        tests:
          - not_null
      - name: ws_bill_cdemo_sk
        description: "The surrogate key for the demographic information of the billing customer."
        tests:
          - not_null
      - name: ws_bill_hdemo_sk
        description: "The surrogate key for the household demographics of the billing customer."
        tests:
          - not_null
      - name: ws_bill_addr_sk
        description: "The surrogate key for the billing address."
        tests:
          - not_null
      - name: ws_ship_customer_sk
        description: "The surrogate key for the shipping customer."
        tests:
          - not_null
      - name: ws_ship_cdemo_sk
        description: "The surrogate key for the demographic information of the shipping customer."
        tests:
          - not_null
      - name: ws_ship_hdemo_sk
        description: "The surrogate key for the household demographics of the shipping customer."
        tests:
          - not_null
      - name: ws_ship_addr_sk
        description: "The surrogate key for the shipping address."
        tests:
          - not_null
      - name: ws_web_page_sk
        description: "The surrogate key for the web page involved in the sale."
        tests:
          - not_null
      - name: ws_web_site_sk
        description: "The surrogate key for the web site involved in the sale."
        tests:
          - not_null
      - name: ws_ship_mode_sk
        description: "The surrogate key for the shipping mode."
        tests:
          - not_null
      - name: ws_warehouse_sk
        description: "The surrogate key for the warehouse."
        tests:
          - not_null
      - name: ws_promo_sk
        description: "The surrogate key for the promotion applied to the sale."
        tests:
          - not_null
      - name: ws_order_number
        description: "The order number for the web sale."
        tests:
          - not_null
          - unique
      - name: ws_quantity
        description: "The quantity of items sold in the web sale."
        tests:
          - not_null
      - name: ws_wholesale_cost
        description: "The wholesale cost of the items sold."
        tests:
          - not_null
      - name: ws_list_price
        description: "The list price of the items sold."
        tests:
          - not_null
      - name: ws_sales_price
        description: "The sales price of the items sold."
        tests:
          - not_null
      - name: ws_ext_discount_amt
        description: "The extended discount amount for the items sold."
        tests:
          - not_null
      - name: ws_ext_sales_price
        description: "The extended sales price for the items sold."
        tests:
          - not_null
      - name: ws_ext_wholesale_cost
        description: "The extended wholesale cost for the items sold."
        tests:
          - not_null
      - name: ws_ext_list_price
        description: "The extended list price for the items sold."
        tests:
          - not_null
      - name: ws_ext_tax
        description: "The extended tax for the items sold."
        tests:
          - not_null
      - name: ws_coupon_amt
        description: "The coupon amount for the items sold."
        tests:
          - not_null
      - name: ws_ext_ship_cost
        description: "The extended shipping cost for the items sold."
        tests:
          - not_null
      - name: ws_net_paid
        description: "The net amount paid for the items sold."
        tests:
          - not_null
      - name: ws_net_paid_inc_tax
        description: "The net amount paid including tax for the items sold."
        tests:
          - not_null
      - name: ws_net_paid_inc_ship
        description: "The net amount paid including shipping for the items sold."
        tests:
          - not_null
      - name: ws_net_paid_inc_ship_tax
        description: "The net amount paid including shipping and tax for the items sold."
        tests:
          - not_null
      - name: ws_net_profit
        description: "The net profit from the web sale."
        tests:
          - not_null