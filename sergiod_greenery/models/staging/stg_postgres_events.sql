with source as (
    select * from {{ source( 'postgres', 'events') }}
)

, renamed_recast as (
    SELECT
        event_id AS address_guid,
        session_id AS session_guid,
        event_type,
        page_url,
        created_at,
        order_id AS order_guid,
        product_id AS product_guid
    from SOURCE
)

SELECT * FROM renamed_recast