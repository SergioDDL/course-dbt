with source as (
    select * from {{ source( 'postgres', 'users') }}
)

, renamed_recast as (
SELECT
 user_id AS user_guid,
 first_name,
 last_name,
 email,
 phone_number,
 created_at,
 updated_at,
 address_id AS address_guid
FROM SOURCE
)

SELECT * FROM renamed_recast