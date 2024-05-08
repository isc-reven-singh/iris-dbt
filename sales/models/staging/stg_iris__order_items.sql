-- stg_iris__order_items.sql

WITH source AS (
  SELECT * FROM {{ source('iris', 'orderitems') }}
)

SELECT
  source.OrderItemID AS order_item_id,
  source.OrderID AS order_id,
  source.ProductID AS product_id,
  source.Quantity AS quantity,
  source.Price AS price

FROM source;
