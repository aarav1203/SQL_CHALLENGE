use sql_challenge;
create table players(
player_id int,
group_id int,
primary key(player_id));

create table matches(
match_id int,
first_player int,
second_player int,
first_score int,
second_score int,
primary key(match_id));

-- Q.132The winner in each group is the player who scored the maximum total points within the group. In the
-- case of a tie, the lowest player_id wins.
-- Write an SQL query to find the winner in each group.
-- Return the result table in any order.

select * from players;
select * from matches;
with cte as(
select m.first_player as player,m.first_score as score,p.group_id
from matches m inner join players p on m.first_player=p.player_id
union all
select m.second_player as player,m.second_score as score,p.group_id
from matches m inner join players p on m.second_player=p.player_id
),
cte2 as(
select group_id,player,sum(score)as total_score
from cte group by group_id,player
)select group_id,player as player_id from(
select group_id,player,rank() over(partition by group_Id order by total_score desc ,player)as rn
from cte2)a
where rn=1;