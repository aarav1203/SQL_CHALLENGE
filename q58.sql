use sql_challenge;
create table cinema(
seat_id int auto_increment primary key,
free bool);
select * from cinema;

-- Q58.Write an SQL query to report all the consecutive available seats in the cinema.
-- Return the result table ordered by seat_id in ascending order.
-- The test cases are generated so that more than two seats are consecutively available.
with cte as(
select seat_id,free as curr_seat,
						lead(free) over(order by seat_id) as next_seat,
                        lead(free,2)over(order by seat_id) as next_two_seat,
                        lag(free) over(order by seat_id) as prev_seat,
                        lag(free,2) over(order by seat_id) as  prev_two_seat
                        from cinema)
                        select seat_id
							from cte 
                            where (curr_seat=1 and next_seat=1 and next_two_seat=1) or
								  (curr_seat=1 and prev_seat=1 and next_seat=1) or
                                  (curr_seat=1 and prev_seat=1 and prev_two_seat=1)
                                  order by seat_id;
