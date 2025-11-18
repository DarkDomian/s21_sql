SELECT pizza_name, price, pz.name AS pizzeria_name, visit_date
FROM person_visits pv
JOIN person pn ON pv.person_id = pn.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
RIGHT JOIN menu mn ON pz.id = mn.pizzeria_id
WHERE 
	pn.name = 'Kate' AND
	mn.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;