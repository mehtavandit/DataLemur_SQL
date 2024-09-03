WITH TEMP AS(
SELECT
  CAST(measurement_time as DATE) as measurement_day,
  measurement_value,
  RANK() OVER(PARTITION BY CAST(measurement_time as DATE) ORDER BY measurement_time) AS number
FROM measurements
)

SELECT
  measurement_day,
  SUM(measurement_value) FILTER (WHERE number%2!=0) as odd_sum,
  SUM(measurement_value) FILTER (WHERE number%2=0) as even_sum
FROM temp
GROUP BY measurement_day;