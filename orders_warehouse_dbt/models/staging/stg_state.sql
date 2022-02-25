WITH source_state AS (
    SELECT *
    FROM {{ source('warehouse', 'state') }}
),
renamed as (
    SELECT state_identifier::INT AS state_id,
        state_code::VARCHAR(2) AS state_code,
        st_name::VARCHAR(30) AS state_name
    FROM source_state
)
SELECT *
FROM renamed
