{%- macro positive_values() %}

Select*
from {{ref('stg_postgres_orders')}}
Where {{order_cost}}<0

{%- endmacro %}