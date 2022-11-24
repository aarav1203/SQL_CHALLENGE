use sql_challenge;
create table transactions5(
transaction_id int,
type  enum('deposit', 'withdrawal'),
amount float,
transaction_date timestamp);

-- Q157.Say you have access to all the transactions for a given merchant account. Write a query to print the
-- cumulative balance of the merchant account at the end of each day, with the total balance reset back
-- to zero at the end of the month. Output the transaction date and cumulative balance.

select * from transactions5;

with cte as(
select transaction_id,type,transaction_date,
	case when type='withdrawal' then  -1*amount
    else amount end as amount 
    from transactions5
    )
 select transaction_date,round(sum(amount),2) as balance
 from cte
 group by day(transaction_date)
 order by date(transaction_date);
    
    