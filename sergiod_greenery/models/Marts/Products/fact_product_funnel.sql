   {{ 
    config(
        materialized='table'
    )
}}
   
 with sessions_events_agg as (
    select * 
    from {{ ref ('int_sessions_events_agg') }}
)

    select 
        event_session_guid,
        case when sum(page_views) > 0 then 1 else 0 end as page_views,
        case when sum(add_to_carts) > 0 then 1 else 0 end as add_to_carts,
        case when sum(checkouts) > 0 then 1 else 0 end as checkouts
    from sessions_events_agg
    group by 1