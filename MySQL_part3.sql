USE `movielens`;

SHOW tables;

/* List the titles and release dates of movies released
between 1983-1993 in reverse chronological order*/

SELECT * 
FROM `movies`
WHERE `release_date`
BETWEEN '1983-01-01' AND '1993-12-31'
ORDER BY `release_date` DESC;

/* 2 Without using LIMIT, list the titles of the movies with the
lowest average rating*/
-- I cheat a bit here at first I determine the lowest rating (1)--
SELECT MIN(`rating`) AS 'lowest_rating'
FROM `ratings`;

-- Then using join and nested queries I obtain a list of movies having rating 1---
SELECT `ratings`.`movie_id`, `movies`.`title`, `ratings`.`rating`
FROM `ratings`
INNER JOIN `movies` 
ON `ratings`.`movie_id` = `movies`.`id`
HAVING `rating` = (
	SELECT MIN(`rating`) AS 'lowest_rating'
	FROM `ratings`
);

/* 3 List the unique records for Sci-Fi movies where male
24-year-old students have given 5-star ratings */
SELECT `users`.`age`, 	
	`users`.`gender`, 
    `users`.`id`, 
    `ratings`.`movie_id`, 
    `ratings`.`rating`,
    `genres_movies`.`genre_id`,
    `genres`.`name`
FROM `users`
JOIN `ratings`
ON `users`.`id` = `ratings`.`user_id`
JOIN `genres_movies`
ON `ratings`.`movie_id` =`genres_movies`.`movie_id`
JOIN `genres`
ON `genres_movies`.`genre_id` = `genres`.`id`
HAVING `age`=24 AND `gender`='M' AND `rating`= 5 AND `name`='Sci-Fi';

SELECT * FROM `genres`;

--- Now I need to relate the user id to the rating---

/* 4 List the unique titles of each of the movies released on the
most popular realease day*/


