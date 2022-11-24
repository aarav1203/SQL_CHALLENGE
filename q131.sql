use sql_challenge;
create table activity2(
player_id int,
device_id int,
event_date date,
games_played int,
primary key(player_id, event_date));

select * from activity2;

-- Q131.Write an SQL query to report for each install date, the number of players that installed the game on
-- that day, and the day one retention.
-- Return the result table in any order.
with cte as(
select player_id,event_date as curr_date,lead(event_date) over(partition by player_id order by event_date) as next_date
from activity2
),cte1 as(
select distinct(player_id),curr_date,
case when datediff(next_date,curr_date)= 1 then 1 else 0 end as chk
from cte
group by player_id)
select curr_date as install_dt,count(player_id) as installs,round((sum(chk)/count(chk)),1)as retention_rate
from cte1
group by curr_Date;