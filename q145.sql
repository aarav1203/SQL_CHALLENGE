use sql_challenge;
create table hackers(
hacker_id int,
name varchar(30));

create table difficulty(
difficulty_level int,
score int);

create table challenges(
challenge_id int,
hacker_id int,
difficulty_level int);

create table submission(
submission_id int,
hacker_id int,
challenge_id int,
score int);


insert into hackers values(5580,'Rose');
insert into hackers values(8439,'Angela');
insert into hackers values(27205,'Frank');
insert into hackers values(52243,'Patrick');
insert into hackers values(52243,'Lisa');
insert into hackers values(57645,'Kimberly');
insert into hackers values(77726,'Bonnie');
insert into hackers values(83082,'Michael');
insert into hackers values(86870,'Todd');
insert into hackers values(90411,'Joe');


insert into difficulty values(1,20);
insert into difficulty values(2,30);
insert into difficulty values(3,40);
insert into difficulty values(4,60);
insert into difficulty values(5,80);
insert into difficulty values(6,100);
insert into difficulty values(7,120);

insert into challenges values(4810,77726,4);
insert into challenges values(21089,27205,1);
insert into challenges values(36566,5580,7);
insert into challenges values(66730,52243,6);
insert into challenges values(71055,52243,2);


insert into submission values(68628,77726,36566,30);
insert into submission values(65300,77726,21089,10);
insert into submission values(40326,52243,36566,77);
insert into submission values(8941,27205,4810,4);
insert into submission values(83554,77726,66730,30);
insert into submission values(43353,52243,66730,0);
insert into submission values(55385,52348,71055,20);
insert into submission values(39784,27205,71055,23);
insert into submission values(94613,86870,71055,30);
insert into submission values(45788,52348,36566,0);
insert into submission values(93058,86870,36566,30);
insert into submission values(7344,8439,66730,92);
insert into submission values(2721,8439,4810,36);
insert into submission values(523,5580,71055,4);
insert into submission values(49105,52348,66730,0);
insert into submission values(55877,57645,66730,80);
insert into submission values(38355,27205,66730,35);
insert into submission values(3924,8439,36566,80);
insert into submission values(97397,90411,66730,100);
insert into submission values(84162,83028,4810,40);
insert into submission values(97431,90411,71055,30);


-- Q145.Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard!
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more
-- than one challenge. Order your output in descending order by the total number of challenges in which
-- the hacker earned a full score. If more than one hacker received full scores in the same number of
-- challenges, then sort them by ascending hacker_id.

with cte as(
select s.hacker_id,h.name,s.challenge_id,s.score as obtained_score,c.difficulty_level,d.score as max_score
from submission s left join hackers h on s.hacker_id=h.hacker_id
left join challenges c on c.challenge_id=s.challenge_id left join difficulty d on c.difficulty_level=d.difficulty_level
)
select hacker_id,name
from cte
where obtained_score=max_score
group by hacker_id
having count(*)>=1
order by count(*) desc,hacker_id limit 1 ;
