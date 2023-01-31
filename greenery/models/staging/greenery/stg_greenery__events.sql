with

source as (
  select * from {{ source('greenery', 'users') }}
)