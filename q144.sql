use sql_challenge;
create table packages(
id int,
salary float);

create table friends(
id int,
friend_id int);

create table students3(
id int,
name varchar(30));

insert into packages values(1,15.20);
insert into packages values(2,10.06);
insert into packages values(3,11.55);
insert into packages values(4,12.12);

insert into friends values(1,2);
insert into friends values(2,3);
insert into friends values(3,4);
insert into friends values(4,1);

insert into students3 values(1,'AShley');
insert into students3 values(2,'Samantha');
insert into students3 values(3,'Julia');
insert into students3 values(4,'Scarlet');

-- Q144. Write a query to output the names of those students whose best friends got offered a higher salary
-- than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed
-- that no two students get the same salary offer.

select * from packages;
select * from friends;
select * from students3;

with cte as(
select s.id,s.name,f.friend_id,p.salary as student_salary,p1.salary as friend_salary
from students3 s left join friends f
on s.id=f.id left join packages p 
on s.id=p.id left join packages p1 
on f.friend_id=p1.id
)
select name from cte
where student_salary <friend_salary
order by friend_salary;

