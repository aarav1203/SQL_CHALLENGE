use sql_challenge;
create table rental_amenities(
rental_id int,
amentity varchar(30));

-- Q152.The Airbnb Booking Recommendations team is trying to understand the "substitutability" of two
-- rentals and whether one rental is a good substitute for another. They want you to write a query to find
-- the unique combination of two Airbnb rentals with the same exact amenities offered.
-- Output the count of the unique combination of Airbnb rentals.

select * from rental_amenities;

with cte as(
select rental_id,group_concat(amentity order by amentity) as amentities
from rental_amenities
group by rental_id)
select count(*) as matching_airbnb from(
select amentities,count(distinct amentities) as gp_match
from cte
group by amentities having count(*)>1)a;
