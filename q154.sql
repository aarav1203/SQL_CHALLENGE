use sql_challenge;
create table employee_pay(
employee_id int,
salary int,
title varchar(30));

-- Q154. Write a query that shows the following data for each compensation outlier: employee ID, salary, and
-- whether they are potentially overpaid or potentially underpaid (refer to Example Output below).
with cte as(
select title,round(avg(salary),2) as avg_salary
from employee_pay
group by title
)
select employee_Id ,salary ,status from(
select e.employee_id,e.salary,
		case when e.salary > 2*c.avg_salary then 'Overpaid'
			when e.salary < c.avg_salary/2 then 'Underpaid'
            end as status
            from  employee_pay e inner join cte c 
            on e.title=c.title)a
            where status is not null;