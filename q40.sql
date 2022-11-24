use sql_challenge;
create table prices(
product_id int,
start_date date,
end_date date,
price int,
primary key(product_id, start_date, end_date)
);
create table unitssold(
product_id int,
purchase_date date,
unit int
);
select * from prices;
select * from unitssold;

-- Write an SQL query to find the average selling price for each product. average_price should be
-- rounded to 2 decimal places.
-- Return the result table in any order

select p.product_id,round(sum(unit*price)/sum(unit),2) as average_price from
prices p inner join unitssold u
on p.product_id=u.product_id and u.purchase_date between p.start_date and p.end_date
group by product_id;