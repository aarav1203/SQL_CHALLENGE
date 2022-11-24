use sql_challenge;
create table  payments(
payer_id int,
recipient_id int,
amount int);

-- Q148.You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. A
-- two-way unique relationship is established when two people send money back and forth. Write a
-- query to find the number of two-way unique relationships in this data.
-- Assumption:
-- ● A payer can send money to the same recipient multiple times

select count(p1.payer_id) as unique_relationships
from payments p1 inner join payments p2
on p1.payer_id=p2.recipient_id and p1.recipient_id=p2.payer_id and p1.payer_id>p2.payer_id;
