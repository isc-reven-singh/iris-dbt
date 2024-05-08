-- stg_iris__customers.sql

WITH source AS (
  SELECT * FROM {{ source('iris', 'customers') }}
)

SELECT
  source.CustomerID AS customer_id,
  source.Name AS name,
  source.Email AS email

FROM source;
