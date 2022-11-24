use sql_challenge;
create table transactions3(
transaction_id int,
merchant_Id int,
credit_card_id int,
amount int,
transaction_timestamp datetime)

select * from transactions3;

-- Q86.Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or
-- a retry error that causes a credit card to be charged twice.
-- Using the transactions table, identify any payments made at the same merchant with the same credit
-- card for the same amount within 10 minutes of each other. Count such repeated payments


select count(t1.transaction_id) as payment_count
from transactions3 t1 inner join transactions3 t2 
on t1.merchant_id=t2.merchant_id and t1.credit_card_id=t2.credit_card_id and t1.amount=t2.amount
and t2.transaction_timestamp>t1.transaction_timestamp
where timestampdiff(minute,t1.transaction_timestamp,t2.transaction_timestamp)<10;