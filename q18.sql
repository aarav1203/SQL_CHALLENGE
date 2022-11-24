use sql_challenge;
create table if not exists views(
article_id int,
author_id int,
viewer_id int,
viewer_date date);

select * from views;
-- Write an SQL query to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

select a.author_id as id from views a inner join views v 
on a.author_id=v.viewer_id and v.author_id=a.viewer_id and a.article_id=v.article_id
order by id;