use sql_challenge;
create table ads(
ad_id int,
user_id int,
action enum ('Clicked', 'Viewed', 'Ignored'),
primary key(ad_id,user_id)
);
select * from ads;

-- Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
-- Return the result table ordered by ctr in descending order and by ad_id in ascending order in case of a tie.
with cte as(
select ad_id,action,
case when action ='Clicked' then 1 
when action='Viewed' then 0 else null end as chk
from ads 
)
select ad_id, ifnull(round(100*sum(chk)/count(chk),2),0) as ctr
from cte group by ad_id
order by ctr desc ,ad_id asc;

