{{
  config(
    materialized='view'
  )
}}

SELECT 
    OrderLineId , 
    OrderId as order_id, 
    CustomerId as customer_id, 
    ProductId, 
    Quantity, 
    Datetime as order_date
FROM 
    `nomadic-asset-268508.ChallengeTest.tbl_orders` 