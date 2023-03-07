USE `sakila`;



/* 1 Which actor has appeared in the most films */
SELECT `actor_id`, COUNT(`actor_id`) AS 'number_of_films'
FROM `film_actor`
GROUP BY `actor_id`
ORDER BY `number_of_films` DESC
LIMIT 1;

/* 2 What is the average running time of all films in the database*/
SELECT AVG(`length`) AS 'average_running_time'
FROM `film`;

/* 3 What is the average running time of films by category*/
SELECT AVG(`length`) AS 'average_runtime', `category` 
FROM `film_list`
GROUP BY `category`;

/* 4 How many movies have ROBOTs in them? */
SELECT COUNT(`title`) AS 'movies_contain_robot' 
FROM `film_list`
WHERE `description` LIKE '%Robot%';

/* 5 Find the movies(s) with the longest runtime*/
SELECT MAX(`length`)  AS 'longest_runtime'
FROM `film`;

/* 6 Count how many movies were released in 2010 */
SELECT  COUNT(`title`) AS 'movies_release_year_2010'
FROM `film`
WHERE `release_year` = 2010;

/* 7 Which last names are not repeated?*/
SELECT DISTINCT `last_name` AS 'distinct_last_name'
FROM `actor`;
