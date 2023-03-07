USE `sakila`;
/* 1 Select all actors from the table*/
SELECT *
FROM `actor`;

/* 2 Find all actors with the first_name 'John'*/
SELECT *
FROM `actor`
WHERE `first_name` = 'John' 
LIMIT 1;

/* 3 Find all actors with the surname 'Neeson' */
SELECT *
FROM `actor`
WHERE `last_name` = 'Neeson';

/* 4 Find all actors with ID numbers divisible by 10*/
SELECT *
FROM `actor`
WHERE `actor_id` % 10 = 0;

/* 5 What is the description of the movie with ID of 100*/
SELECT `film_id`, `description` 
FROM `film`
WHERE `film_id` = 100;

/* 6 Find every movie with a rating of 'R'*/
SELECT `title`, `rating`
FROM `film`
WHERE `rating` = 'R';

/* 7 Find every movie except those a rating of 'R'*/
SELECT `title`, `rating`
FROM `film`
WHERE `rating` != 'R';

/* 8 Find the 10 most shortest movies. Now return only the movie titles'*/
SELECT `title`, `length`
FROM `film`
ORDER BY `length`
LIMIT 10;

/* 9 Find all movies with Deleted Scenes*/
SELECT `title`, `special_features`
FROM `film`
WHERE `special_features` LIKE '%Deleted Scenes%';

/* 10 How many distinct countries are there*/
SELECT COUNT(DISTINCT `country`) AS 'number_of_distinct_countries'
FROM `country`;

/* 11 What are the names of all the languages in the database
(sorted alphabetically)?*/
SELECT DISTINCT `name` AS 'language_names'
FROM `language`
ORDER BY `name`;



