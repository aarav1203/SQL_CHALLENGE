use sql_challenge;
create table movies(
movie_id int,
title varchar(30),
primary key(movie_id)
);
create table users2(
user_id int,
name varchar(30),
primary key(user_id)
);
 create table movierating(
 movie_id int,
 user_id int,
 rating int,
 created_at date,
 primary key(movie_id, user_id)
 );
 select * from movies;
 select * from users2;
 select * from movierating;
 
 -- Q35.Write an SQL query to:
-- ● Find the name of the user who has rated the greatest number of movies. In case of a tie,
-- return the lexicographically smaller user name.
SELECT U.NAME 
FROM USERS2 U LEFT JOIN MOVIERATING MR 
ON U.USER_ID=MR.USER_ID
GROUP BY NAME
ORDER BY COUNT(MR.RATING) DESC ,NAME LIMIT 1;
-- ● Find the movie name with the highest average rating in February 2020. In case of a tie, return
-- the lexicographically smaller movie name.

SELECT M.TITLE
 FROM MOVIES M LEFT JOIN MOVIERATING MR 
 ON M.MOVIE_ID=MR.MOVIE_ID
 GROUP BY TITLE
 ORDER BY AVG(MR.RATING) DESC ,TITLE LIMIT 1;



