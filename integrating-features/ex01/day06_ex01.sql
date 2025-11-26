INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT
	ROW_NUMBER() OVER() AS id,
	ags.person_id,
	ags.pizzeria_id,
	CASE
		WHEN ags.order_count = 1 THEN 10.5
		WHEN ags.order_count = 2 THEN 22
		ELSE 30
	END AS discount
FROM (
	-- aggregated state
	SELECT person_id, pizzeria_id, COUNT(*) AS order_count
	FROM person_order po
	JOIN menu mn ON po.menu_id = mn.id
	GROUP BY person_id, pizzeria_id
) AS ags;