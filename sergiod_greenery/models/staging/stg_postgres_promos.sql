with source as (
    select * from {{ source( 'postgres', 'promos') }}
)

, renamed_recast as (
  SELECT
    promo_id AS promo_guid,
    discount,
    status
  FROM SOURCE
)

SELECT * FROM renamed_recast