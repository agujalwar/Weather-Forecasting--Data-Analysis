# Can you check for all 4 consecutive days when the temperature was below 30 Fahrenheit

with t1 as(
#select date , temperature,
select *,
row_number() over ( order by date) as RN,
date - row_number() over( order by date) as difference
from weather_forecast.new_wf_data
where Temperature < 30
),
t2 as 
(select *, count(*) over(partition by difference) as no_of_records
from t1)
select *
from t2
where no_of_records = 4;










