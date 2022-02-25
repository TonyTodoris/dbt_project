WITH orders AS (
    SELECT *
    FROM {{ ref('fct_orders') }}
),
customers AS (
    SELECT *
    FROM {{ ref('dim_customers') }}
)
SELECT o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    c.zipcode AS customer_zipcode,
    c.city AS customer_city,
    c.state_code AS customer_state_code,
    c.state_name AS customer_state_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
    AND o.order_purchase_timestamp >= c.valid_from
    AND o.order_purchase_timestamp <= c.valid_to
