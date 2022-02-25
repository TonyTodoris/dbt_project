WITH source_customers AS (
    SELECT *
    FROM {{ ref('customers_snapshot') }}
), 
renamed as (
    SELECT customer_id,
        zipcode,
        city,
        state_code,
        datetime_created::TIMESTAMP AS datetime_created,
        datetime_updated::TIMESTAMP AS datetime_updated,
        dbt_valid_from,
        dbt_valid_to
    FROM source_customers
)
SELECT *
FROM renamed
