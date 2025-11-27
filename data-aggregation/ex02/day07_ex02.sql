(SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
JOIN menu mn ON po.menu_id = mn.id
JOIN pizzeria pz ON mn.pizzeria_id = pz.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)

UNION ALL

(SELECT name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)

ORDER BY action_type ASC, count DESC;