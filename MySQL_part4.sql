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
	`actor`.`first_name`,
    `actor`.`last_name`,
    `film`.`title`
FROM `film`
JOIN `film_actor`
ON `film`.`film_id` = `film_actor`.`film_id`
JOIN `actor`
ON `film_actor`.`actor_id` = `actor`.`actor_id`
HAVING `first_name` = 'Fred' AND `last_name` = 'Costner';

/*4 Find out which location has the most BUCKET BROTHERHOOD*/



/* 5 Create a list of categories and the number of films for each  category*/
/*6 Create a list of actors and the number of movies by each actor*/
/*7 Is 'Academy Dinosaur' available for rent from Store 1*/

/*8 When is 'Academy Dinosaur' due*/