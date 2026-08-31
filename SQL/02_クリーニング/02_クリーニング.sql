--クリーニングの実行--

create or replace table cyclistic_analysis.trips_clean AS (
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  TIMESTAMP_DIFF(ended_at,started_at,second) AS Duration_time,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat, start_lng, end_lat, end_lng,
  member_casual,
  extract(dayofweek from started_at) AS day_of_week,
  extract(hour from started_at) AS hour_of_day,
FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_raw` 
WHERE
  TIMESTAMP_DIFF(ended_at,started_at,second) >= 60 
  AND TIMESTAMP_DIFF(ended_at,started_at,second) < 1962.5
  AND member_casual IN ('member', 'casual')
)


--クリーニング後のデータ数--

SELECT
  (SELECT COUNT(*) FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_raw`)  AS A,
  (SELECT COUNT(*) FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean`) as B,
  (SELECT COUNT(*) FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_raw` )-(SELECT COUNT(*) FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` ) 

