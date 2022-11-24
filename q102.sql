use sql_challenge;
create table useractivity(
username varchar(30),
activity varchar(30),
startdate date,
enddate date);

-- Q102.Write an SQL query to show the second most recent activity of each user.
-- If the user only has one activity, return that one. A user cannot perform more than one activity at the
-- same time. Return the result table in any order

select * from useractivity;

with cte as(
select *,rank() over(partition by username order by enddate desc) as rn,
lead(enddate) over(partition by username order by enddate desc) as next_activity
from useractivity
)
select username,activity,startdate,enddate
from cte
where (rn=2 and next_activity is not null) or (rn=1 and next_activity is null);
