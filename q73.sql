use sql_challenge;
create table actions(
user_id int,
post_id int,
action_date date,
action enum('view', 'like', 'reaction', 'comment', 'report', 'share'),
extra varchar(30)
);
create table removals(
post_id int,
remove_date date,
primary key(post_id));

-- Q73.Write an SQL query to find the average daily percentage of posts that got removed after being
-- reported as spam, rounded to 2 decimal places.

select * from actions;
select * from removals;

with cte as(
select a.post_Id,a.action_date,
count(case when action='report' and extra='spam' then 1 else null end) as spam_count,
count(case when action='report' and extra='spam' and remove_date is not null then 1 else null end) as del_count 
from actions a left join removals r
on a.post_id=r.post_id
group by date(action_date)
)
select round(avg(daily_del_avg)) as average_daily_percent from(
select action_date,round((100.0*del_count/spam_count),2) as daily_del_avg
from cte)a
where daily_del_avg is not null;

-- Q74.Write an SQL query to report the fraction of players that logged in again on the day after the day they
-- first logged in, rounded to 2 decimal places. In other words, you need to count the number of players
-- that logged in for at least two consecutive days starting from their first login date, then divide that
-- number by the total number of players.

-- Q74. and Q75. are same and also repeated previously
