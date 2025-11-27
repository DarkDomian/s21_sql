SELECT name, count_of_visits
FROM (
	SELECT person_id, COUNT(*) AS count_of_visits
	FROM person_visits
	GROUP BY person_id
) AS ags 
JOIN person pn ON ags.person_id = pn.id
ORDER BY count_of_visits DESC, pn.id ASC
LIMIT 4;