use sql_challenge;
create table user_actions(
user_id int,
event_id int,
event_type enum("sign-in", "like", "comment"),
event_date datetime);

select * from user_actions;

-- Q121.Assume you have the table below containing information on Facebook user actions. Write a query to
-- obtain the active user retention in July 2022. Output the month (in numerical format 1, 2, 3) and the
-- number of monthly active users (MAUs)
WITH CTE AS
(
SELECT 
user_id,
event_date,
EXTRACT(MONTH FROM event_date) - LAG(EXTRact(MONTH FROM event_date)) OVER(partition by user_id order by event_date) as month_number 
FROM 
user_actions
) 
SELECT
Extract(month FROM event_date) as month,
COUNT(*) as monthly_active_users FROM
CTE
WHERE month_number = 1
GROUP by 1
ORDER BY 2 desc
LIMIT 1;
