use sql_challenge;
create table inventory(
item_id int,
item_type varchar(30),
item_category varchar(30),
square_footage float);

select * from inventory;

-- Q81.Write a SQL query to find the number of prime and non-prime items that can be stored in the 500,000
-- square feet warehouse. Output the item type and number of items to be stocked.

SELECT item_type,
    (CASE WHEN item_type = 'prime_eligible' 
          THEN floor(500000/total_square_footage) * total_item_type
          ELSE floor(((500000) - (floor(500000/(SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible'))* 
          (SELECT SUM(square_footage) FROM inventory WHERE item_type = 'prime_eligible')))/(total_square_footage)
          ) * total_item_type END) AS item_count   

FROM(SELECT item_type,
      COUNT(item_type) AS total_item_type,
      SUM(square_footage) AS total_square_footage
FROM inventory
GROUP BY item_type) AS temp_table1       
ORDER BY item_count DESC;
