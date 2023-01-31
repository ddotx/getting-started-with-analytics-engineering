with

event_add_to_cart as (
  select *, 
  count(distinct session_id)
   from events 
   where event_type = 'add_to_cart'
   
   group by 1

)

unique_session as (
  select distinct session_id
  from events
)
, final as (
  select
  count(event_add_to_cart) / count(unique_session)
)

