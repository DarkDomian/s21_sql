SELECT p.name AS pizzeria_name
FROM pizzeria p
JOIN person_visits pv ON p.id = pv.pizzeria_id
JOIN person pe ON pv.person_id = pe.id
GROUP BY p.name
HAVING COUNT(*) FILTER (WHERE pe.gender = 'female') != 
       COUNT(*) FILTER (WHERE pe.gender = 'male')
ORDER BY pizzeria_name;