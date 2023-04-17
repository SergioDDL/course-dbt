with source as (
    select * from {{ source( 'postgres', 'products') }}
)

, renamed_recast as (
    SELECT
    product_id AS product_guid,
    name,
    price,
    inventory
    FROM SOURCE
)

select * FROM renamed_recast
