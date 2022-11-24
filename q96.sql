use sql_challenge;
create table song_history(
history_id int,
user_id int,
song_id int,
song_plays int);

create table songs_weekly(
user_id int,
song_id int,
listen_time datetime);

-- Q96.You're given two tables on Spotify users' streaming data. songs_history table contains the historical
-- streaming data and songs_weekly table contains the current week's streaming data.
-- Write a query to output the user id, song id, and cumulative count of song plays as of 4 August 2022 sorted in descending order.

select user_id,song_id,sum(song_plays) as song_plays from(
select user_id,song_id,song_plays from 
song_history union all
select user_id,song_id,count(song_id) as song_plays
from songs_weekly
where listen_time<='2022-08-04 23:59:59'
GROUP BY user_id,song_id)report
group by user_id,song_id
order by song_plays desc;
