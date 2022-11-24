use sql_challenge;
create table transactions4(
user_id int,
amount float,
transaction_date timestamp);

-- Q151.In an effort to identify high-value customers, Amazon asked for your help to obtain data about users
-- who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more
-- consecutive days. List the user IDs who have gone on at least 1 shopping spree in ascending order.

select * from transactions4;
with cte as(
select *,
	transaction_date -row_number() over(partition by user_id order by transaction_date) as gp_date
    from transactions4)
    select distinct user_id
    from cte
    group by user_id,date(gp_date) having count(*)>=3;
