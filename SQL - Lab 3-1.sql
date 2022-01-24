-- ACTIVITY 1
-- 1) Drop column picture from staff.
ALTER TABLE sakila.staff DROP COLUMN picture;

SELECT * FROM sakila.staff;

-- 2) A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

-- This query is to fetch the information for the new staff
SELECT * FROM sakila.customer where first_name = 'TAMMY' and last_name = 'SANDERS';

-- Now I add the new line to the staff table
INSERT INTO sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, active, username,  last_update) VALUES (3, 'Tammy', 'Sanders', 79, 'Tammi.Sanders@sakilastaff.com', 2, 1, 'Tammy', current_timestamp());
SELECT * FROM sakila.staff;

DELETE  from sakila.staff WHERE staff_id = 3;

-- 3) Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
-- Queries to fetch information:
SELECT staff_id, store_id FROM sakila.inventory WHERE first_name = 'Mike' AND last_name = 'Hillyer';
-- staff_id = 1, store_id = 1

SELECT film_id FROM sakila.film WHERE title = 'ACADEMY DINOSAUR';
SELECT inventory_id FROM sakila.inventory WHERE store_id = 1 and film_id = 1;
-- inventory_id = 1 (I already knew that all copies are available in that store from a previous lab)

SELECT customer_id FROM sakila.customer WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
-- customer_id = 130

SELECT * FROM sakila.rental;
INSERT INTO sakila.rental (rental_date, inventory_id, customer_id, staff_id, last_update) VALUES (current_timestamp(), 1, 130, 1, current_timestamp());

SELECT * FROM sakila.rental WHERE inventory_id = 1 and staff_id = 1 and customer_id;
