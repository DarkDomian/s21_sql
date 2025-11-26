CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT name AS pizzeria_name
FROM person_discounts pd
JOIN pizzeria pz ON pd.pizzeria_id = pz.id
WHERE person_id = (SELECT id FROM person WHERE name = 'Irina');