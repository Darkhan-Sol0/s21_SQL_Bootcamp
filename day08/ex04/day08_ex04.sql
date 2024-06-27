-- Session #1
-- STEP #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- STEP #3
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- STEP #6
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- STEP #7
COMMIT;
-- STEP #8
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- Session #2
-- STEP #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- STEP #4
UPDATE pizzeria
SET rating = 3
WHERE name = 'Pizza Hut';
-- STEP #5
COMMIT;
-- STEP #9
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';