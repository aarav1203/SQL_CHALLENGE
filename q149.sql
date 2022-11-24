use sql_challenge;
create table user_transaction1(
transaction_id int,
user_id int,
spend float,
transaction_Date timestamp);

insert into user_transaction1 values(759274, 111, 49.50, '2022-02-03 00:00:00');
insert into user_transaction1 values(850371 ,111, 51.00, '2022-03-15 00:00:00' );
insert into user_transaction1 values(615348, 145 ,36.30, '2022-03-22 00:00:00');
insert into user_transaction1 values(137424, 156, 151.00 ,'2022-04-04 00:00:00');
insert into user_transaction1 values(248475, 156, 87.00 ,'2022-04-16 00:00:00');

-- Q149. Assume you are given the table below on user transactions. Write a query to obtain the list of
-- customers whose first transaction was valued at $50 or more. Output the number of users.
-- Clarification:
-- ● Use the transaction_date field to determine which transaction should be labeled as the first
-- for each user.
-- ● Use a specific function (we can't give too much away!) to account for scenarios where a user
-- had multiple transactions on the same day, and one of those was the first.

select * from user_transaction1;

select count(user_id) as users from(
select user_id,spend,rank() over(partition by user_id order by transaction_date) as rn
from user_transaction1)a
where rn=1 and spend>=50