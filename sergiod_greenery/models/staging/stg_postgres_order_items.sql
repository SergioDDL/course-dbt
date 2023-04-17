with source as (
    select * from {{ source( 'postgres', 'order_items') }}
)

, renamed_recast as (
    SELECT
    order_id AS order_guid,
    product_id AS product_guid,
    quantity
    FROM SOURCE

)

SELECT * FROM renamed_recast