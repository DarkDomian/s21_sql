WITH orders_count AS (
	SELECT name, COUNT(*) AS count, 'order' AS action_type
	FROM person_order po
	JOIN menu mn ON po.menu_id = mn.id
	JOIN pizzeria pz ON mn.pizzeria_id = pz.id
	GROUP BY name
),
visits_count AS (
	SELECT name, COUNT(*) AS count, 'visit' AS action_type
	FROM person_visits pv
	JOIN pizzeria pz ON pv.pizzeria_id = pz.id
	GROUP BY name
)

SELECT
	(CASE WHEN oc.name IS NULL THEN vc.name ELSE oc.name END),
	COALESCE(oc.count, 0) + COALESCE(vc.count, 0) AS total_count
FROM orders_count oc
FULL JOIN visits_count vc ON oc.name = vc.name
ORDER BY total_count DESC, name ASC;