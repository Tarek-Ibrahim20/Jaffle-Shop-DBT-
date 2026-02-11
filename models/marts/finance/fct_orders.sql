-- order_id
-- customer_id
-- amount (hint: this has to come from payments)


-- select o.order_id , o.customer_id , p.amount ,
-- from {{ ref('stg_jaffle_shop__orders') }} as o
-- join {{ ref('stg_stripe__payments') }} as p

-- on o.order_id = p.orderid


with orders as  (
    select * from {{ ref ('stg_jaffle_shop__orders' )}}
),

payments as (
    select * from {{ ref ('stg_stripe__payments') }}
),

order_payments as (
    select
        orderid as order_id,
        sum (case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

 final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce (order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final