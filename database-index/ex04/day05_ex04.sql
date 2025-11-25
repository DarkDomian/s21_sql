CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM menu
WHERE pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'DoDo Pizza')
	AND pizza_name = 'cheese pizza';