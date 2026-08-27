--平均値/中央値を求める

SELECT  
  member_casual,
  AVG(Duration_time)/60 AS avg_duration,
  approx_quantiles(Duration_time,2)[offset(1)]/60 as median_duration
FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
GROUP BY member_casual


--曜日/タイプ別


SELECT
  member_casual,
  day_of_week,
  COUNT(*) AS ride_count,
  avg(Duration_time)/60 AS avg_duration,

FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
GROUP BY member_casual,day_of_week
ORDER BY member_casual,day_of_week



--曜日/時間/タイプ

SELECT
  member_casual, day_of_week, hour_of_day,
  COUNT(*) AS count_ride

FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
GROUP BY member_casual, day_of_week, hour_of_day
ORDER BY   member_casual, day_of_week, hour_of_day


--会員別月間推移--

SELECT
  extract(month from started_at) AS month,
  member_casual,
  COUNT(*) AS ride_num

FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
GROUP BY member_casual,month  
ORDER BY member_casual,month



--どの駅でよく使用されているのか（会員別）--
WITH RANKING AS (
SELECT
  member_casual,start_station_name,start_lat,start_lng,
  COUNT(*) AS ride_count,
  ROW_NUMBER() OVER(partition by member_casual order by count(*) DESC) AS rnk
FROM
  `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
WHERE start_station_name IS NOT NULL
GROUP BY member_casual,start_station_name,start_lat,start_lng
ORDER BY member_casual,rnk ASC)

SELECT
  member_casual, start_station_name, ride_count,start_lat,start_lng, rnk
FROM RANKING
WHERE rnk <= 10


--バイクタイプ/会員別

SELECT
  member_casual,rideable_type,
  COUNT(*) AS ride_num
FROM
  `cyclistic-analysis-506602.cyclistic_analysis.trips_clean` 
GROUP BY member_casual,rideable_type