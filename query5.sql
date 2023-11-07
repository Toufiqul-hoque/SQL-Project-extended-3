-- Name: G M Toufiqul Hoque
-- Course: DA651.1001
-- Assignment: Project 8
-- Select the address of all addresses in cities that start with “M”. Try to use an
-- IN statement rather than a JOIN statement. Return just the address column. Order
-- your results by address.

USE sakila;
SELECT address
FROM address
WHERE city_id IN (
SELECT city_id 
FROM city 
WHERE city LIKE 'M%')
ORDER BY address;