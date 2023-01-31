with

orders as (

    select * from {{ ref('stg_greenery__orders') }}

)

, user_orders as (

    select
        user_id
        , count(order_id) as order_count
    
    from orders
    group by 1

)

, user_bucket as (

    select
        user_id
        , (order_count >= 2)::int as has_two_orders

    from user_orders

)

, final as (

    select
        sum(has_two_orders)::float / count(distinct user_id)::float as repeat_rate
    
    from user_bucket
    

)

select * from final
