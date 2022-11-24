use sql_challenge;
create table actiondirector(
actor_Id int,
director_id int,
timestamp int,
primary key(timestamp));

-- Q62.Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has
-- cooperated with the director at least three times.
-- Return the result table in any order.

select actor_id,director_Id
from actiondirector
group by actor_id,director_id
having count(*)>=3;