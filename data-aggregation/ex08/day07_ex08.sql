SELECT 
    pn.address,
    pz.name,
    COUNT(*) AS count_of_orders
FROM person_order po
JOIN person pn ON po.person_id = pn.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY pn.address, pz.name
ORDER BY 1, 2;