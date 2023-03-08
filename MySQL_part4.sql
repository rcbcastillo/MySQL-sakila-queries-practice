USE `sakila`;

/* 1 What is the average runing time of films by category ? */
SELECT `category`.`name`,
		AVG(`f`.`length`) AS 'average_runtime_by_category'
FROM `film` AS `f`
JOIN `film_category` AS `fc`
ON `f`.`film_id` = `fc`.`film_id`
JOIN `category` 
ON `fc`.`category_id` = `category`.`category_id`
GROUP BY `category`.`category_id`
ORDER BY `average_runtime_by_category` DESC;

/* 2 Which lastnames appear more than one?*/
SELECT `last_name`
FROM `actor` 
GROUP BY `last_name`
HAVING COUNT(`last_name`) > 1;


/* 3 Retrieve all movies that Fred Costner has appeared in */
SELECT 
	CONCAT(`actor`.`first_name`, ' ', `actor`.`last_name`) AS 'fullname',
    `film`.`title`
FROM `film`
JOIN `film_actor`
ON `film`.`film_id` = `film_actor`.`film_id`
JOIN `actor`
ON `film_actor`.`actor_id` = `actor`.`actor_id`
HAVING `fullname` = 'Fred Costner';

/*4 Find out which location has the most copies of BUCKET BROTHERHOOD*/
SELECT
	`film`.`title`,
    COUNT(`film`.`title`)
FROM `inventory` AS `i`
JOIN `film`
ON `i`.`film_id` = `film`.`film_id`
GROUP BY `title`;

-- the first thing to know is where are the copies


/* 5 Create a list of categories and the number of films for each  category*/

SELECT 
	`c`.`name` AS 'category_name',
	COUNT(`f`.`title`) AS 'number_of_films'
FROM `film_category` AS `fc`
JOIN `category` AS `c`
ON `fc`.`category_id` = `c`.`category_id`
JOIN `film` AS `f`
ON `fc`.`film_id` = `f`.`film_id`
GROUP BY `category_name`;

/*6 Create a list of actors and the number of movies by each actor*/
SELECT 
	CONCAT(`a`.`first_name`,' ', `a`.`last_name`) AS 'fullname',
	COUNT(`f`.`title`) AS 'number_of_films'
FROM `film_actor` AS `fa`
JOIN `actor` AS `a`
ON `fa`.`actor_id` = `a`.`actor_id`
JOIN `film` AS `f`
ON `fa`.`film_id` = `f`.`film_id`
GROUP BY `fullname`;

/*7 Is 'Academy Dinosaur' available for rent from Store 1*/
SELECT
	`film`.`title`,
    `i`.`store_id`    
FROM `inventory` AS `i`
JOIN `film`
ON `i`.`film_id` = `film`.`film_id`
HAVING `title` = 'Academy Dinosaur' AND `store_id` = 1; -- it is avaialble

/*8 When is 'Academy Dinosaur' due*/
SELECT `film`.`title`, `film`.`rental_duration`,
		DATEDIFF(`rental`.`return_date`,`rental`.`rental_date`) AS 'diff',
        `rental`.`return_date`
FROM `rental`
JOIN `inventory`
ON `rental`.`inventory_id` = `inventory`.`inventory_id`
JOIN `film`
ON `inventory`.`film_id` = `film`.`film_id`
HAVING `title` = 'ACADEMY DINOSAUR' AND `rental_duration` < `diff`;
