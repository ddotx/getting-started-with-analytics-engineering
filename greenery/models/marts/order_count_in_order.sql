-- with order_counts_in_each_hour as (
--    select
--      date_trunc('hour', created_at)
--      , count(order_id) as order_count
--    from {{source('greenery', 'orders')}}
--    group by 1
--  )

 select
   avg(order_count)
 from order_counts_in_each_hour

with order_counts_in_each_hour as (
   select
     date_trunc('hour', created_at)
     , count(order_id) as order_count
   from {{ref('stg_greenery__orders')}}
   group by 1
 )

 select
   avg(order_count)
 from order_counts_in_each_hour

