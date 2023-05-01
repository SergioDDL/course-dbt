with fact_page as 
(
    
SELECT A.*, B.name 
from {{ref('stg_postgres_events')}} A
LEFT JOIN {{ref('stg_postgres_products')}} B
on A.product_guid = B.product_guid


)

select * from fact_page
WHERE event_type ='page_view'
