# Query 9 Find the number of days when the temperature went below 0 degrees Celsius 


select count(*) 
from weather_forecast.new_wf_data
where 0 > ((temperature - 32)* 5/9)


