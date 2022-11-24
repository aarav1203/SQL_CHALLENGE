use sql_challenge;
create table measurements(
measurement_id int,
measurement_value float,
measurement_time datetime);

-- Q150.Assume you are given the table below containing measurement values obtained from a sensor over
-- several days. Measurements are taken several times within a given day.
-- Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a
-- particular day, in two different columns.

select * from measurements;
with cte as(
select date(measurement_time) as measurement_day,measurement_value,
row_number() over(partition by day(measurement_time) order by measurement_id)as rn
from measurements)
select measurement_day,
round(sum(case when rn%2=1 then measurement_value else 0 end),2) as odd_sum,
round(sum(case when rn%2=0 then measurement_value else 0 end),2) as even_sum
from cte
group by measurement_day;


