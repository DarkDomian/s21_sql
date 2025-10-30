WITH
wanted_menu AS (
	SELECT menu_id AS id
	FROM person pn
	JOIN person_order po ON pn.id = po.person_id
	WHERE name = 'Denis' OR name = 'Anna'
)

SELECT 
	pizza_name,
	pz.name AS pizzeria_name
FROM wanted_menu
NATURAL JOIN menu mn
JOIN pizzeria pz ON mn.pizzeria_id = pz.id
ORDER BY pizza_name, pizzeria_name;