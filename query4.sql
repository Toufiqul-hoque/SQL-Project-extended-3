-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 8
-- first and last names of all customers who have rented an R-rated film that has a trailer as a special feature. Return the first and last names of the
-- customers, as well as the total number of such films they have rented. Order your results by film number (decreasing), then last name, then first name.

USE sakila;

WITH table_t AS (
SELECT f.film_id, f.special_features, c.first_name, c.last_name, f.rating, c.customer_id
FROM payment p
INNER JOIN customer c
ON p.customer_id= c.customer_id
INNER JOIN rental r
ON p.rental_id=r.rental_id
INNER JOIN  inventory i
ON r.inventory_id=i.inventory_id
INNER JOIN film f
ON f.film_id= i.film_id
 )

SELECT ff.first_name, ff.last_name, COUNT(ff.customer_id) AS total
FROM table_t ff
WHERE ff.rating LIKE 'R' AND ff.special_features LIKE '%trailer%'
GROUP BY ff.customer_id
ORDER BY total DESC, ff.last_name, ff.first_name;



