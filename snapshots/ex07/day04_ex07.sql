-- add new data for Dmitriy's visit
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT 
	(SELECT MAX(id) + 1 FROM person_visits),
	pn.id,
	(
		SELECT pz.id FROM pizzeria pz
		JOIN menu mn ON mn.pizzeria_id = pz.id
		WHERE price < 800 AND pz.name NOT IN (SELECT * FROM mv_dmitriy_visits_and_eats)
		LIMIT 1
	),
	'2022-01-08'::DATE
FROM person pn WHERE pn.name = 'Dmitriy'; 

-- refresh materialized view
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;