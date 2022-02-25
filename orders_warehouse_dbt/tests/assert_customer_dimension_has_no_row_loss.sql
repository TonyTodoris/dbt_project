-- dim_customers must have the same number of rows as its staging counterpart
-- Therefore return records where this isn't true to make the test fail
SELECT *
from (
        SELECT dim_cust.customer_id
        FROM {{ ref('dim_customers') }} dim_cust
        LEFT JOIN {{ ref('stg_customers') }} stg_cust ON dim_cust.customer_id = stg_cust.customer_id
        WHERE stg_cust.customer_id IS null
        UNION ALL
        SELECT stg_cust.customer_id
        FROM {{ ref('stg_customers') }} stg_cust
        LEFT JOIN {{ ref('dim_customers') }} dim_cust ON stg_cust.customer_id = dim_cust.customer_id
        WHERE dim_cust.customer_id IS null
    ) tmp
