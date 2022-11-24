use sql_challenge;
create table person(
id int,
name varchar(30),
phone_number varchar(30),
primary key(id)
);
create table country(
name varchar(30),
country_code varchar(30),
primary key(country_code));

create table calls1(
caller_id int,
callee_id int,
duration int
);
select * from person;
select * from country;
select * from calls1;

-- Q55. Write an SQL query to find the countries where this company can invest.
-- Return the result table in any order
with cte1 as(
select id ,name,phone_number,
case when substring(phone_number,1,1)=0 then substring(phone_number,2,2) 
	 else substring(phone_number,1,3) end as country_code
     from person),
cte2 as(
select cn.name,c.duration
from calls1 c inner join cte1 ct on c.caller_id=ct.id or c.callee_id=ct.id  left join country cn on ct.country_code=cn.country_code
order by caller_id)
select name from cte2
group by name 
having avg(duration)>(select avg(duration) from cte2);
	