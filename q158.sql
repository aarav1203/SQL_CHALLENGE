use sql_challenge;
create table product_spend(
category varchar(30),
product varchar(30),
user_id int,
spend float,
transaction_date timestamp);

-- Q158 Assume you are given the table below containing information on Amazon customers and their spend
-- on products belonging to various categories. Identify the top two highest-grossing products within
-- each category in 2022. Output the category, product, and total spend.

select * from product_spend;
with cte as(
select category,product,round(sum(spend),2) as total_spend
from product_spend
where year(transaction_date)=2022
group by category,product)
select category,product,total_spend from(
select category,product,total_spend,dense_rank() over(partition by category order by total_spend desc) as rn
from cte)a
where rn in(1,2)
order by category,product,total_spend;