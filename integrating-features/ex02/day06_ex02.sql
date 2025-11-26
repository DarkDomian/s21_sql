SELECT 
	pn.name,
	mn.pizza_name,
	price,
	price - (pd.discount/100 * price)::INTEGER AS discount_price,
	pz.name AS pizzeria_name
FROM person_order po
JOIN person pn ON po.person_id = pn.id
JOIN menu mn ON po.menu_id = mn.id
JOIN pizzeria pz ON mn.pizzeria_id = pz.id
JOIN person_discounts pd ON pd.person_id = pn.id AND pd.pizzeria_id = pz.id
ORDER BY 1, 2;