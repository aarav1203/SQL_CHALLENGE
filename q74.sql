use sql_challenge;
create table activity1(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date)
);
select * from activity1;

-- Q.43 Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.
with cte as(
select player_id,event_date as curr_date,
lead(event_date) over(partition by player_Id order by event_date) as next_date
from activity1
)
select 
round(100.0*count(distinct case when datediff(next_date,curr_date)=1 then 1 else null end)/count(distinct player_id),2) as fraction
from cte;
