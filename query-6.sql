# query 6
# Use the GROUP BY clause on the Date column and make a query to fetch details for average windspeed ( which is now windspeed done in task 3 )

select Date,
	avg(windspeed)
from weather_forecast.new_wf_data 
group by Date
