use sql_challenge;
create table sales1(
sale_date date,
fruit varchar(30),
sold_num int,
primary key(sale_date, fruit)
);
select * from sales1;
-- Q42.Write an SQL query to report the difference between the number of apples and oranges sold each day.
-- Return the result table ordered by sale_date
with cte as(
select * ,
		case when fruit='oranges' then -1*sold_num else sold_num end as gp_num
        from sales1
        )
        select sale_date,sum(gp_num) as diff from cte 
        group by sale_date
        order by sale_date;