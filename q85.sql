use sql_challenge;
create table server_utilization1(
server_id int,
status_time timestamp,
session_status varchar(30));

-- Q85. Amazon Web Services (AWS) is powered by fleets of servers. Senior management has
-- requested data-driven solutions to optimise server usage.
-- Write a query that calculates the total time that the fleet of servers was running. The output should be
-- in units of full days.
-- Level - Hard
-- Hint1. Calculate individual uptimes


with cte as(
select server_id,status_time,
case when session_status='stop' then  lag(status_time) over(partition by server_id order by status_time) 
 end as prev_time
 from server_utilization1
 )
 select round(sum(running_time)/86400) as total_uptime_days from(
 select server_id,sum(timestampdiff(second,prev_time,status_time)) running_time
 from cte
 where prev_time is not null
 group by server_id)a;