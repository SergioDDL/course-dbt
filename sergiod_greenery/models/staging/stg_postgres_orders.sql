with source as (
    select * from {{ source( 'postgres', 'orders') }}
)

, renamed_recast as (
SELECT
    order_id AS order_guid,
    promo_id,
    user_id AS user_guid,
    created_at,
    order_cost,
    shipping_cost,
    order_total,
    tracking_id AS tracking_guid,
    shipping_service,
    estimated_delivery_at,
    delivered_at,
    address_id AS address_guid,
    status 
FROM SOURCE
)

SELECT * FROM renamed_recast