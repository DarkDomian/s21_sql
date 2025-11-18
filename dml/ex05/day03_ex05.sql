-- select all visits by Andrey
SELECT DISTINCT pz.name AS pizzeria_name
FROM person pn
JOIN person_visits pv ON pv.person_id = pn.id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE pn.name = 'Andrey'

EXCEPT
-- Throw except of order's by Andrey
SELECT DISTINCT pz.name AS pizzeria_name
FROM person pn
JOIN person_order po ON po.person_id = pn.id
JOIN menu mn ON po.menu_id = mn.id
JOIN pizzeria pz ON pz.id = mn.pizzeria_id
WHERE pn.name = 'Andrey';