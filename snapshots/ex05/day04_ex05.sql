CREATE VIEW v_price_with_discount AS
	SELECT name, pizza_name, price,
		(price * 0.9)::INTEGER AS discount_price
	FROM person_order po
	JOIN person pn ON po.person_id = pn.id
	JOIN menu mn ON po.menu_id = mn.id
	ORDER BY name, pizza_name;