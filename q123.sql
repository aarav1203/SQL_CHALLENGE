use sql_challenge;
create table advertiser(
user_id varchar(30),
status varchar(30));
create table daily_pay(
user_id varchar(15),
paid float);

insert into daily_pay values('yahoo',45.00);
insert into daily_pay values('alibaba', 100.00);
insert into daily_pay values('target', 13.00);

-- Q123.Write a query to update the Facebook advertiser's status using the daily_pay table. Advertiser is a
-- two-column table containing the user id and their payment status based on the last payment and
-- daily_pay table has current information about their payment. Only advertisers who paid will show up in
-- this table.

select * from advertiser;
select * from daily_pay;

WITH payment_status AS (
SELECT
  advertiser.user_id,
  advertiser.status,
  payment.paid
FROM advertiser
LEFT JOIN daily_pay AS payment
  ON advertiser.user_id = payment.user_id

UNION

SELECT
  payment.user_id,
  advertiser.status,
  payment.paid
FROM daily_pay AS payment
LEFT JOIN advertiser
  ON advertiser.user_id = payment.user_id
)

SELECT
  user_id,
  CASE WHEN paid IS NULL THEN 'CHURN'
  	WHEN status != 'CHURN' AND paid IS NOT NULL THEN 'EXISTING'
  	WHEN status = 'CHURN' AND paid IS NOT NULL THEN 'RESURRECT'
  	WHEN status IS NULL THEN 'NEW'
  END AS new_status
FROM payment_status
ORDER BY user_id;