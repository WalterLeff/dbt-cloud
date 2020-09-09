{{
  config(
    materialized='table'
  )
}}

SELECT 
    (orders.ProductId), 
    SUM(orders.Quantity) as Number_of_sales, 
    products.ProductName, 
    products.Supplier, 
    products.EAN, 
    round(SUM(products.price),2) as total_sold_amount, 
    round(products.price, 2) as unit_price  
FROM 
    `nomadic-asset-268508.ChallengeTest.tbl_products` as products 
JOIN `nomadic-asset-268508.ChallengeTest.tbl_orders` as orders on products.Id = orders.ProductId
group by 
    orders.ProductId, products.ProductName, products.Supplier, products.EAN, products.price
order by 
    Number_of_sales desc
LIMIT 1000