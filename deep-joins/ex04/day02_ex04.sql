WITH 
wanted_pizza AS (
	SELECT
		pizzeria_id AS id,
		pizza_name,
		price
	FROM menu
	WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
)

SELECT 
	pizza_name,
	pizzeria.name AS pizzeria_name,
	price
FROM wanted_pizza
NATURAL JOIN pizzeria
ORDER BY pizza_name, pizzeria_name;