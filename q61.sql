use sql_challenge;
create table point(
x int,
primary key(x));
insert into point values(-1);
insert into point values(0);
insert into point values(2);
select * from point;

-- Q61.Write an SQL query to report the shortest distance between any two points from the Point table
with cte as(
select p1.x,p2.x as x1 ,abs(p1.x-p2.x) as diff from 
point p1 inner join point p2 
on p1.x>p2.x or p1.x<p2.x
)
select min(diff) as shortest from cte;