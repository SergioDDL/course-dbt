with fact_page_views as 
(

SELECT A.*, B.name 
from {{ref('stg_postgres_events')}} A
LEFT JOIN {{('stg_postgres_products)}} B
on A.product_guid = B.product_guid
WHERE event_type = 'page_view'
)
select * from fact_page_views
