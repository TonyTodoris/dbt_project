WITH customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
),
state AS (
    SELECT *
    FROM {{ ref('stg_state') }}
)
SELECT c.customer_id,
    c.zipcode,
    c.city,
    c.state_code,
    s.state_name,
    c.datetime_created,
    c.datetime_updated,
    c.dbt_valid_from::TIMESTAMP AS valid_from,
    CASE
        WHEN c.dbt_valid_to IS NULL THEN '9999-12-31'::TIMESTAMP
        ELSE c.dbt_valid_to::TIMESTAMP
    END AS valid_to
FROM customers c
JOIN state s ON c.state_code = s.state_code
