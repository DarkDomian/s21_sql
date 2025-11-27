SELECT name, COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person pn ON pv.person_id = pn.id
GROUP BY name
HAVING COUNT(*) > 3
ORDER BY name;