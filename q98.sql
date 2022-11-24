use sql_challenge;
create table tweets(
tweet_id int,
user_id int,
tweet_date timestamp);

-- Q98. The table below contains information about tweets over a given period of time. Calculate the 3-day
-- rolling average of tweets published by each user for each date that a tweet was posted. Output the
-- user id, tweet date, and rolling averages rounded to 2 decimal places.
-- Hint- Use Count and group by

select * from tweets;

with cte as(
select user_id,tweet_date,count(user_id) as tweet_count
from tweets
group by user_id,date(tweet_date)
)
select user_id,tweet_date,
round(sum(tweet_count) over(partition by user_id order by tweet_date rows between 2 preceding and current row) /
count(user_id) over(partition by user_id order by tweet_date rows between 2 preceding and current row),2) as rolling_avg_3_days
from cte 
order by user_id;
