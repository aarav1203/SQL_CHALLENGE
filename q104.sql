use sql_challenge;
create table employee6(
employee_Id int,
name varchar(30),
months int,
salary int);
insert into employee6 values(12228,'Rose',15,1968);
insert into employee6 values(33645,'Angela',1,3443);
insert into employee6 values(45692,'Frank',17,1608);
insert into employee6 values(56118,'Patrick',7,1345);
insert into employee6 values(59725,'Lisa',11,2330);
insert into employee6 values(74197,'Kimberly',16,4372);
insert into employee6 values(78454,'Bonnie',8,1771);
insert into employee6 values(83565,'Michael',6,2017);
insert into employee6 values(98607,'Todd',5,3396);
insert into employee6 values(99989,'Joe',9,3573);

select * from employee6;
-- Q104.Write a query that prints a list of employee names (i.e.: the name attribute) for employees in
-- Employee having a salary greater than $2000 per month who have been employees for less than 10
-- months. Sort your result by ascending employee_id

select name from employee6
where salary > 2000 and months <10
order by employee_id;