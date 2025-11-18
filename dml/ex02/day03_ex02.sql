WITH
unwanted AS (
	SELECT id AS menu_id FROM menu
	EXCEPT
	SELECT DISTINCT menu_id FROM person_order
)

SELECT pizza_name, price, pz.name AS pizzeria_name
FROM unwanted uw
JOIN menu mn ON uw.menu_id = mn.id
JOIN pizzeria pz ON mn.pizzeria_id = pz.id
ORDER BY pizza_name, price;