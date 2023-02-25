# 4. Can you find the maximum number of days for which temperature dropped 

WITH cte AS (
  SELECT *,
    Temperature - LAG (Temperature) over (ORDER BY date) AS diff
  FROM 
    weather_forecast.new_wf_data
),
cte2 AS (
  SELECT *,
	CASE WHEN diff >= 0 THEN 1 ELSE 0 END AS reset_flag,
    SUM(CASE WHEN diff < 0 THEN 1 ELSE 0 END) 
      OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) AS running_total
  FROM 
    cte
),
cte3 AS (
  SELECT *,
	CASE 
      WHEN diff < 0 THEN 1
      ELSE 0
    END AS is_decreasing,
    SUM(reset_flag) 
      OVER (ORDER BY date ) AS grp
  FROM 
    cte2
),

cte4 AS (

    SELECT *,
	SUM(is_decreasing) OVER(Partition by grp ORDER BY date) AS running_sum
  FROM cte3
),

cte5 AS (

    SELECT *,
	CASE WHEN running_sum = 0 THEN LAG(running_sum) OVER (ORDER BY date) ELSE 0 END AS consecutive_day_count
  FROM cte4
)

SELECT 
  MAX(consecutive_day_count) AS max_consecutive_decreasing_days

FROM 
  cte5