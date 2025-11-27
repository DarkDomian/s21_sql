SELECT
	name,
	COUNT(*) AS count_of_orders,
    ROUND(AVG(mn.price), 2) AS average_price,
    MAX(mn.price) AS max_price,
    MIN(mn.price) AS min_price
FROM person_order po
JOIN menu mn ON po.menu_id = mn.id
JOIN pizzeria pz ON mn.pizzeria_id = pz.id
GROUP BY name
ORDER BY name;