-- Session #1
-- STEP #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- STEP #3
SELECT SUM(rating)
FROM pizzeria;
-- STEP #6
SELECT SUM(rating)
FROM pizzeria;
-- STEP #7
COMMIT;
-- STEP #8
SELECT SUM(rating)
FROM pizzeria;
-- Session #2
-- STEP #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- STEP #4
INSERT INTO pizzeria
VALUES (10, 'Kazan Pizza', 5);
-- STEP #5
COMMIT;
-- STEP #9
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';