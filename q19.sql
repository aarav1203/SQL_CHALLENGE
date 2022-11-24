use sql_challenge;
create table delivery(
delivery_id int,
customer_id int,
order_date date,
customer_pref_delivery_date date,
primary key(delivery_id)
);
select * from delivery;

-- If the customer's preferred delivery date is the same as the order date, then the order is called
-- immediately; otherwise, it is called scheduled.
-- Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
-- places.

select 
	round(100.0*count(case when order_date=customer_pref_delivery_date then 1 else null end)/count(*),2) as immediate_percentage
    from delivery;