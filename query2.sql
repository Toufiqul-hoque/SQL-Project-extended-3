-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 8
-- Description: Run query all films that star Bob Fawcett, find the total revenue for each film made
-- from rentals. Return the name of the film and the total revenue. Order your results by revenue.

USE sakila;

WITH actors_s AS ( 
SELECT actor_id,first_name, last_name
FROM actor 
WHERE first_name='Bob' AND last_name ='fawcett'),

actors_s_pg AS (
SELECT s.actor_id, s.first_name, s.last_name, f.film_id, f.title, SUM(p.amount) revenue
FROM actors_s s
INNER JOIN film_actor fa
ON s.actor_id=fa.actor_id
INNER JOIN film f
ON f.film_id=fa.film_id
INNER JOIN inventory i
ON i.film_id=f.film_id
INNER JOIN rental r
ON r.inventory_id= i.inventory_id
INNER JOIN payment p
ON p.rental_id=r.rental_id
GROUP BY f.film_id
)
SELECT v.title, v.revenue
FROM actors_s_pg v
ORDER BY v.revenue DESC;