# Query 5  - Can you find the average of average humidity from the dataset 
#( NOTE: should contain the following clauses: group by, order by, date )


select date, avg(Humidity) as avg_Humid
from weather_forecast.new_wf_data
group by date 
order by avg_humid desc