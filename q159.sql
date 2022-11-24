use sql_challenge;
create table users4(
user_id int,
signup_date datetime,
last_login datetime);

-- Q159.Facebook is analysing its user signup data for June 2022. Write a query to generate the churn rate by
-- week in June 2022. Output the week number (1, 2, 3, 4, ...) and the corresponding churn rate rounded
-- to 2 decimal places.
-- For example, week number 1 represents the dates from 30 May to 5 Jun, and week 2 is from 6 Jun to 12 Jun.

select * from users4;

-- SET SQL_SAFE_UPDATES = 0;
-- insert into users4 values(1001, '2022-06-01 12:00:00' ,'2022-07-05 12:00:00');
-- delete from users4 where user_id=1001;
with cte as(
select user_id,signup_date,last_login,
WEEK(signup_date,6) - WEEK(DATE_SUB(signup_date, INTERVAL DAYOFMONTH(signup_date)-1 DAY),6)+1 as signup_week,
	   case when datediff(last_login,signup_date)<28 then 1
       else 0 end as chk
       from users4)
       select signup_week,round((100.0*sum(chk)/count(chk)),2) as churn_rate
       from cte
       group by signup_week;
