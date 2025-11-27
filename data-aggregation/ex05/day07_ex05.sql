SELECT DISTINCT name
FROM person_order po
JOIN person pn ON po.person_id = pn.id
ORDER BY name;