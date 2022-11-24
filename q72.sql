use sql_challenge;
create table transactions(
id int,
country varchar(30),
state enum ("approved", "declined"),
amount int,
trans_date date,
primary key(id));

select * from transactions;

-- Q72.Write an SQL query to find for each month and country, the number of transactions and their total
-- amount, the number of approved transactions and their total amount. Return the result table in any order.
select date_format(trans_date,'%Y-%m') as date from transactions;
with cte as(
select date_format(trans_date,'%Y-%m') as date,country,state,amount,
case when state='declined' then 0 else amount end amount_val,
case when state='declined' then 0 else 1 end approved_count
from transactions)
				select date as month,country,count(*) as trans_count,sum(approved_count) as approved_count,
                sum(amount) as trans_total_amount,sum(amount_val) as approved_total_amount
                from cte
                group by date,country;