with dim_products_orders as 
(

SELECT 
name,
price,
inventory,
SUM(quantity) as orders_per_product
from DEV_DB.DBT_SERGIOD.STG_POSTGRES_ORDER_ITEMS A
LEFT JOIN DEV_DB.DBT_SERGIOD.STG_POSTGRES_PRODUCTS B
on A.product_guid = B.product_guid
group by 1,2,3
)

select *
from dim_products_orders