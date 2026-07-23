with orders as (
    select * from {{ ref('stg_jaffle_shop_orders') }}
),
payments as (
    select * from {{ ref('stg_stripe__payments') }}
)

select 
    o.order_id,
    o.customer_id,
    p.amount
from 
    orders o join payments p 
        on o.order_id = p.orderid