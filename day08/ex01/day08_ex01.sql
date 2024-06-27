-- Session #1
-- STEP #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- STEP #3
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- STEP #5
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
-- STEP #7
COMMIT;
-- STEP #9
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
-- STEP #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- STEP #4
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- STEP #6
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- STEP #8
COMMIT;
-- STEP #10
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';