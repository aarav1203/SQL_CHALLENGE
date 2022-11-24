use sql_challenge;
create table project1(
project_id int,
employee_Id int,
primary key(project_id ,employee_id),
foreign key(employee_id) references employee4(employee_Id));
create table employee4(
employee_Id int,
name varchar(30),
exp_year int,
primary key(employee_id));

select * from project1;
select * from employee4;

-- Q64.Write an SQL query that reports the average experience years of all the employees for each project,
-- rounded to 2 digits.Return the result table in any order.
select p.project_id,round(avg(e.exp_year),1) as average_years
from project1 p left join employee4 e
on p.employee_id=e.employee_Id
group by project_id;
