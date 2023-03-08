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
JOIN `film` ON `i`.`film_id` = `film`.`film_id`
GROUP BY `title`;

SELECT * FROM `address`;
-- the first thing to know is where are the copies


/* 5 Create a list of categories and the number of films for each  category*/
SELECT 
	`c`.`name` AS 'category_name',
	COUNT(`f`.`title`) AS 'number_of_films'
FROM `film_category` AS `fc`
JOIN `category` AS `c` ON `fc`.`category_id` = `c`.`category_id`
JOIN `film` AS `f` ON `fc`.`film_id` = `f`.`film_id`
GROUP BY `category_name`;

/*6 Create a list of actors and the number of movies by each actor*/
SELECT 
	CONCAT(`a`.`first_name`,' ', `a`.`last_name`) AS 'fullname',
	COUNT(`f`.`title`) AS 'number_of_films'
FROM `film_actor` AS `fa`
JOIN `actor` AS `a` ON `fa`.`actor_id` = `a`.`actor_id`
JOIN `film` AS `f` ON `fa`.`film_id` = `f`.`film_id`
GROUP BY `fullname`;

/*7 Is 'Academy Dinosaur' available for rent from Store 1*/
SELECT
	`f`.`title`, 
    `i`.`inventory_id`,
    `i`.`store_id`    
FROM `inventory` AS `i`
JOIN `store` AS `s` ON `i`.`store_id` = `s`.`store_id`
JOIN `film` AS `f` ON `i`.`film_id` = `f`.`film_id`
WHERE `f`.`title` = 'ACADEMY DINOSAUR'
AND `s`.`store_id` = 1; -- it is available

/*8 When is 'Academy Dinosaur' due*/
SELECT 
	CONCAT(`customer`.`last_name`, '', `customer`.`first_name`) AS 'customer_name',
	`film`.`title`,
    (`rental`.`rental_date` + interval(`film`.`rental_duration`) DAY) AS 'due_return_date'
FROM `rental` 
JOIN `customer` ON `rental`.`customer_id` = `customer`.`customer_id`
JOIN `inventory` ON `rental`.`inventory_id` = `inventory`.`inventory_id`
JOIN `film` ON `inventory`.`film_id` = `film`.`film_id`
WHERE `rental`.`return_date` IS NULL
AND (`rental`.`rental_date` + interval(`film`.`rental_duration`) DAY) < current_date()
AND `title` = 'ACADEMY DINOSAUR';
