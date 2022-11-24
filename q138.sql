use sql_challenge;
create table employee9(
employee_id int,
name varchar(30),
months int,
salary int);
-- creating another copy of table from previous table
create table employee9 as select * from employee6;

-- Q.138 Write a query to find the maximum total earnings for all employees as well as the total number of
-- employees who have maximum total earnings. Then print these values as 2 space-separated integers.

select salary*months as earning,count(*) as no_of_employee
from employee9 where salary*months=(select max(salary*months) from employee9);