use sql_challenge;
create table employees1(
id int,
name varchar(30),
salary int);

insert into employees1 values(1,'Kristeen',1420);
insert into employees1 values(2,'Ashley',2006);
insert into employees1 values(3,'Julia',2210);
insert into employees1 values(4,'Maria',3000);


-- Q106.Samantha was tasked with calculating the average monthly salaries for all employees in the
-- EMPLOYEES table, but did not realise her keyboard's 0 key was broken until after completing the
-- calculation. She wants your help finding the difference between her miscalculation (using salaries
-- with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries),and round it up to the next integer

select  ceil(avg(salary)-avg(replace(salary,'0',''))) as avg_salary from employees1;