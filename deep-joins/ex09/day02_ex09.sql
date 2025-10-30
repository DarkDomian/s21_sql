WITH
cheese_lover AS (
	SELECT pn.id, pn.name
	FROM person_order po
	JOIN menu mn ON po.menu_id = mn.id
	JOIN person pn ON po.person_id = pn.id
	WHERE
		pn.gender = 'female' AND
		mn.pizza_name = 'cheese pizza'
),
pepperoni_lover AS (
	SELECT pn.id, pn.name
	FROM person_order po
	JOIN menu mn ON po.menu_id = mn.id
	JOIN person pn ON po.person_id = pn.id
	WHERE
		pn.gender = 'female' AND
		mn.pizza_name = 'pepperoni pizza'
)

SELECT name
FROM cheese_lover chl
NATURAL JOIN pepperoni_lover ppl
ORDER BY name;