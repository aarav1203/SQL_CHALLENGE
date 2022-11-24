use sql_challenge;

create table functions(
x int ,
y int);

insert into functions values(20,20);
insert into functions values(20,20);
insert into functions values(20,21);
insert into functions values(23,22);
insert into functions values(22,23);
insert into functions values(21,20);

select * from functions;

-- Q143.Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.
select distinct x1,y1 from(
select f1.x as x1,f1.y as y1,f2.x as x2,f2.y as y2
from functions f1 inner join functions f2
on f1.x=f2.y and f1.y=f2.x)a
where x1<=y1
order by x1;

