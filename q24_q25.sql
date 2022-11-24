use sql_challenge;
create table activity(
player_id int,
device_id int,
event_date date,
games_played int,
primary key (player_id, event_date)
);

select * from activity;

-- Q.24 Write an SQL query to report the first login date for each player.
-- Return the result table in any order
select player_id ,min(event_date) as first_login_date
from activity group by player_id;

-- Q.25 Write an SQL query to report the device that is first logged in for each player.
-- Return the result table in any order 
select player_id,device_id from activity a
where event_date=(select min(event_date) from activity group by player_id having player_id=a.player_id);
