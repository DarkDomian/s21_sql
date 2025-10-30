WITH
wanted_pizzeria AS (
	SELECT pizzeria_id AS id
	FROM person_visits pv
	JOIN person pn ON pv.person_id = pn.id
	WHERE visit_date = '2022-01-08' AND pn.name = 'Dmitriy'
)

SELECT DISTINCT name
FROM wanted_pizzeria
NATURAL JOIN pizzeria pz
JOIN menu mn ON mn.pizzeria_id = pz.id
WHERE price < 800;