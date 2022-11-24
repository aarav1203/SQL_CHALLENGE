use sql_challenge;
create table users3(
id int,
name varchar(30),
primary key(id)
);
create table rides1(
id int,
user_id int,
distance int,
primary key(id)
);

-- Q36.Write an SQL query to report the distance travelled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users
-- travelled the same distance, order them by their name in ascending order

select u.name,ifnull(sum(r.distance),0) as travelled_distance
from users3 u left join rides1 r on u.id=r.user_id
group by u.id
order by travelled_distance desc,name;

-- Q.36 AND Q.33 ARE SAME
-- Q.32 AND Q.37 ARE SAME 