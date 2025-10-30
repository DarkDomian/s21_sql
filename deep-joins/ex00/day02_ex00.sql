-- move to the LEFT
SELECT name, rating
FROM pizzeria pz
LEFT JOIN person_visits pv ON pv.pizzeria_id = pz.id
WHERE pv.pizzeria_id IS NULL;

-- move to the RIGTH
SELECT name, rating
FROM person_visits pv
RIGHT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE pv.pizzeria_id IS NULL;