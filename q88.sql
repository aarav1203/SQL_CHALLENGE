use sql_challenge;
create table scores(
player_name varchar(30),
gender varchar(30),
day date,
score_points int,
primary key (gender,day));
select * from scores;

-- Q88.Write an SQL query to find the total score for each gender on each day.
-- Return the result table ordered by gender and day in ascending order.
select gender,day,sum(score_points) over(partition by gender order by day) as total 
from scores
order by gender;
