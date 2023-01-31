-- select count(distinct user_id) as user_counts from {{source('greenery', 'users')}}

select count(distinct user_id) as user_counts from {{ref('stg_greenery__users')}}