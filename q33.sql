use sql_challenge;
create table users1(
id int,
name varchar(30),
primary key(id)
);
create table rides(
id int,
user_id int,
distance int,
primary key(id)
);

select * from users1;
select * from rides;

-- Q33.Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order
select u.name,ifnull(sum(r.distance),0) as travelled_distance
from users1 u left join rides r on u.id=r.user_id
group by u.id
order by travelled_distance desc,name;
