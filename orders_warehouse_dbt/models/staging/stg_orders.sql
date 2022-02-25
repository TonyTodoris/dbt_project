WITH source_orders AS (
    SELECT *
    FROM {{ source('warehouse', 'orders') }}
),
renamed as (
    SELECT order_id,
        cust_id AS customer_id,
        order_status,
        order_purchase_timestamp::TIMESTAMP,
        order_approved_at::TIMESTAMP,
        order_delivered_carrier_date::TIMESTAMP,
        order_delivered_customer_date::TIMESTAMP,
        order_estimated_delivery_date::TIMESTAMP
    FROM source_orders
)
SELECT *
FROM renamed
