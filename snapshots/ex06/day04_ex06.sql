CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT DISTINCT pz.name
	FROM pizzeria pz
	JOIN person_visits pv ON pv.pizzeria_id = pz.id
	JOIN person pn ON pv.person_id = pn.id
	JOIN menu mn ON mn.pizzeria_id = pz.id
	WHERE visit_date = '2022-01-08' AND pn.name = 'Dmitriy' AND price < 800;