# 2. Find the temperature as Cold / hot by using the case and avg of values of the given data set


select Date, Temperature,
case 
when Temperature < 32 then 'cold' 
when Temperature > 32 then 'Hot'
else 'Normal'
end as Temp_Cold_Hot
from weather_forecast.new_wf_data;

