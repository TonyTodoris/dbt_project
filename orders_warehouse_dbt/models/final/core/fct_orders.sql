WITH orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
)
SELECT * FROM orders
