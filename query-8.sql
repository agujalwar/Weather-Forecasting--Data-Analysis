# 8 If the maximum gust speed increases from 55mph, fetch the details for the next 4 days

with t1 as(
select *,
row_number() over ( order by date) as RN,
date - row_number() over( order by date) as difference
from weather_forecast.new_wf_data
where Maximum_gust_speed_mph > 55
),
t2 as 
(select *, count(*) over(partition by difference) as no_of_records
from t1)
select *
from t2
where no_of_records = 4;


