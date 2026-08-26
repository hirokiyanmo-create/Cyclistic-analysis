--使用時間1分以内のカウント--
SELECT 
  COUNT(*)
FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_raw` 
WHERE TIMESTAMP_DIFF(ended_at,started_at,second) <60



--四分位計算/外れ値--

WITH quarter AS (
SELECT
  APPROX_QUANTILES(TIMESTAMP_DIFF(ended_at, started_at, SECOND), 4) AS percentiles
FROM `cyclistic-analysis-506602.cyclistic_analysis.trips_raw` 
)

SELECT
  percentiles[offset(1)] AS one,
  percentiles[offset(3)] AS thee,
  percentiles[offset(3)] + 1.5 * (percentiles[offset(3)] - percentiles[offset(1)]) AS dif
FROM quarter