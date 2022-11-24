use sql_challenge;
create table emails(
email_id int,
user_id int,
signup_date datetime);

create table texts(
text_id int,
email_id int,
signup_action varchar(30));

-- Q97.New TikTok users sign up with their emails, so each signup requires a text confirmation to activate the
-- new user's account.
-- Write a query to find the confirmation rate of users who confirmed their signups with text messages.
-- Round the result to 2 decimal places

select * from texts;
select * from emails;

with cte as(
select e.email_id,t.text_id,e.signup_date,t.signup_action
from emails e left join texts t
on e.email_id=t.email_id
group by email_id having text_id=max(text_id) or text_id is null)
select 
	round((count(case when signup_action='Confirmed' then 1 else null end)/count(email_id)),2) as confirm_rate
    from cte;
