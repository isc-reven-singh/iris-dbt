-- stg_iris__products.sql

WITH source AS (
  SELECT * FROM {{ source('iris', 'products') }}
)

SELECT
  source.ProductID AS product_id,
  source.Name AS name,
  source.Description AS description,
  source.Price AS price,
  source.Category AS category,
  source.Stock AS stock

FROM source;
