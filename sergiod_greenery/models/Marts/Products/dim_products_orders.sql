with dim_products_orders as 
(

SELECT 
B.name,
B.price,
B.inventory,
SUM(A.quantity) as orders_per_product
from {{('stg_postgres_order_items')}} A
LEFT JOIN {{('stg_postgres_products')}} B
on A.product_guid = B.product_guid
group by 1,2,3
)

select *
from dim_products_orders