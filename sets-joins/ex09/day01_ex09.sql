-- using IN
SELECT * FROM pizzeria 
WHERE pizzeria.id NOT IN (
    SELECT pizzeria_id FROM person_visits
	WHERE pizzeria_id IS NOT NULL
);

-- using EXISTS
SELECT *
FROM pizzeria p
WHERE NOT EXISTS (
	SELECT 1 FROM person_visits pv
	WHERE pv.pizzeria_id = p.id
);