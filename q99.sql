use sql_challenge;
create table activities(
activity_id int,
user_id int,
activity_type enum ('send', 'open', 'chat'),
time_spent float,
activity_date datetime);

create table age_breakdown(
user_id int,
age_bucket enum('21-25', '26-30', '31-35')
);

-- Q99.Assume you are given the tables below containing information on Snapchat users, their ages, and
-- their time spent sending and opening snaps. Write a query to obtain a breakdown of the time spent
-- sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

select * from activities;
select * from age_breakdown;

select * from(
select ab.age_bucket,
round(100.0*sum(case when activity_type='send' then time_spent else 0 end)/sum(time_spent),2) as 'send_perc',
round(100.0*sum(case when activity_type='open' then time_spent else 0 end)/sum(time_spent),2) as 'open_perc'
from activities a left join age_breakdown ab
on a.user_id=ab.user_id
group by age_bucket
order by age_bucket)a
where send_perc <> 0 and open_perc <>0;
