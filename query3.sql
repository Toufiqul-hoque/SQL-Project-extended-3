-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 8
-- Select the first and last names of all actors who have starred in an R-rated
-- film that has a trailer as a special feature. Order your results by last name, then first name.

USE sakila;

WITH table_t AS (
SELECT f.film_id, f.special_features, a.first_name, a.last_name, f.rating, a.actor_id
FROM film f
INNER JOIN film_actor fa
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id=fa.actor_id)

SELECT t.first_name, t.last_name
FROM table_t t
WHERE t.rating LIKE 'R' AND t.special_features LIKE '%trailer%'


GROUP BY t.actor_id
ORDER BY t.last_name,t.first_name;

