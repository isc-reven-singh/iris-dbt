-- stg_iris__orders.sql

WITH source AS (
  SELECT * FROM {{ source('iris','orders') }}
)

SELECT
  source.CustomerID AS customer_id,
  source.OrderDate AS order_date,
  source.OrderStatus AS order_status,
  source.EstimatedDeliveryDate AS estimated_delivery_date

FROM source;
