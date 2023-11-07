-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 8
-- Description: Run query all films that star Bob Fawcett, find all the costars in each film. Return the
-- first and last names of the actors and the film title. Order your results by film title, then
-- last name, then first name.

USE sakila;
with table_t AS (SELECT first_name,last_name, title, a.actor_id
FROM film_actor fa
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id= fa.actor_id
WHERE f.film_id IN 
(SELECT f.film_id
FROM film_actor fa
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN actor a
ON a.actor_id= fa.actor_id
WHERE a.first_name='Bob' AND a.last_name='Fawcett')   
)

SELECT t.first_name, t.last_name, t.title
FROM table_t t
WHERE t.actor_id <> 19
ORDER BY title, last_name,first_name
;
 




				








