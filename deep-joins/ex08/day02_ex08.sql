SELECT pn.name
FROM person_order po
JOIN menu mn ON po.menu_id = mn.id
JOIN person pn ON po.person_id = pn.id
WHERE
	pn.gender = 'male' AND
	(pn.address = 'Moscow' OR pn.address = 'Samara') AND
	(mn.pizza_name = 'pepperoni pizza' OR mn.pizza_name = 'mushroom pizza')
ORDER BY name DESC;