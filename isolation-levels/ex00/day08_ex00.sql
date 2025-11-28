-- session #1 rating update
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT name, rating, CURRENT_TIME FROM pizzeria WHERE name = 'Pizza Hut';

-- session #2 check the current data of 'Pizza Hut'
SELECT name, rating, CURRENT_TIME FROM pizzeria WHERE name = 'Pizza Hut';

-- session #1 commit changes to DB
COMMIT;

-- session #2 check the new data of 'Pizza Hut'
SELECT name, rating, CURRENT_TIME FROM pizzeria WHERE name = 'Pizza Hut';