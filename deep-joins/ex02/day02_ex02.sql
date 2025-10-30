WITH
selected_date AS (
SELECT *
FROM person_visits
WHERE visit_date = '2022-01-01' OR visit_date = '2022-01-02' OR visit_date = '2022-01-03'
)
SELECT 
	COALESCE(pn.name, '-') AS person_name,
	visit_date,
	COALESCE(pz.name, '-') AS pizzeria_name
FROM person pn
FULL JOIN selected_date sd ON pn.id = sd.person_id
FULL JOIN pizzeria pz ON sd.pizzeria_id = pz.id
ORDER BY person_name, visit_date, pizzeria_name;