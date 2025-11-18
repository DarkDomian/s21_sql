WITH order_by_gender AS (
	SELECT pz.name AS pizzeria_name, gender
	FROM person_order po
	JOIN person pn ON po.person_id = pn.id
	JOIN menu mn ON po.menu_id = mn.id
	JOIN pizzeria pz ON mn.pizzeria_id = pz.id
)

SELECT pizzeria_name FROM order_by_gender GROUP BY pizzeria_name
HAVING COUNT(*) FILTER (WHERE gender = 'female') > 0 AND
	COUNT (*) FILTER (WHERE gender = 'male') = 0
	
UNION

SELECT pizzeria_name FROM order_by_gender GROUP BY pizzeria_name
HAVING COUNT(*) FILTER (WHERE gender = 'female') = 0 AND
	COUNT (*) FILTER (WHERE gender = 'male') > 0
	
ORDER BY pizzeria_name;