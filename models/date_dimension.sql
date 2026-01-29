with cte as (
    select to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as date_started_at,
    case when dayname(to_timestamp(started_at)) in ('Sat', 'Sun') // macro
        then 'Weekend'
        else 'Business day'
        end as day_type,
    case when month(to_timestamp(started_at)) in (12, 1, 2)
        then 'Winter'
        when month(to_timestamp(started_at)) in (3, 4, 5)
        then 'Spring'
        when month(to_timestamp(started_at)) in (6, 7, 8)
        then 'Summer'
        else 'Autumn'
        end as Season
    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
    limit 10
)
-- select to_timestamp(started_at) from cte
select * from cte
