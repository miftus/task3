{{
  config(
    materialized='ephemeral'
  )
}}

SELECT
    Extract(Year From trip_start_timestamp) as Year_Date, * EXCEPT(trip_start_timestamp, trip_end_timestamp)
FROM
    {{ source('iykra_playgorund', 'chicago_taxi_trips') }}
