INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(id) + 1 FROM person_visits),
	(SELECT id FROM person pn WHERE pn.name = 'Denis'),
	(SELECT id FROM pizzeria pz WHERE pz.name = 'Dominos'),
	'2022-02-24'
);

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(id) + 1 FROM person_visits),
	(SELECT id FROM person pn WHERE pn.name = 'Irina'),
	(SELECT id FROM pizzeria pz WHERE pz.name = 'Dominos'),
	'2022-02-24'
);