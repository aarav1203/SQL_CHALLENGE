use sql_challenge;
create table Countries(
country_id int,
country_name varchar(30),
primary key(country_id)
);
create table Weather(
country_id int,
weather_state int,
day date,
primary key(country_id,day)
);
select * from countries;
select * from weather;

-- Write an SQL query to find the type of weather in each country for November 2019.
-- The type of weather is:
-- ● Cold if the average weather_state is less than or equal 15,
-- ● Hot if the average weather_state is greater than or equal to 25, and
-- ● Warm otherwise.
-- Return result table in any order
with cte as(
select c.country_name,round(avg(weather_state)) as avg_weather
from countries c inner join weather w
on c.country_id=w.country_id
where year(day)=2019 and month(day)=11
group by country_name)
select country_name,
					case when avg_weather<=15 then 'Cold'
						 when avg_weather>=25 then 'Hot'
                         else 'Warm' end as 'weather_type'
                         from cte;