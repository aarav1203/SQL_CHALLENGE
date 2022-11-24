use sql_challenge;
create table salaries(
company_id int,
employee_id int,
employee_name varchar(30),
salary int,
primary key(company_id, employee_id));

-- Q76.Write an SQL query to find the salaries of the employees after applying taxes. Round the salary to the
-- nearest integer.
-- The tax rate is calculated for each company based on the following criteria:
-- ● 0% If the max salary of any employee in the company is less than $1000.
-- ● 24% If the max salary of any employee in the company is in the range [1000, 10000] inclusive.
-- ● 49% If the max salary of any employee in the company is greater than $10000.
-- Return the result table in any order.

select * from salaries;

with cte as(
select company_id,max(salary) as max_salary from 
salaries group by company_id
)
select c.company_id,employee_id,employee_name,
		case when max_salary < 1000 then salary
        when max_salary between 1000 and 10000 then round(salary-(salary*0.24))
        when max_salary> 10000 then round(salary-(salary*0.49))
        else null end as salary
        from salaries s inner join cte c on s.company_id=c.company_id;
        
        