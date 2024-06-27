-- Session #1
-- STEP #1
BEGIN;
-- STEP #3
UPDATE pizzeria
SET rating = 1
WHERE id = 1;
-- STEP #5
UPDATE pizzeria
SET rating = 1
WHERE id = 2;
-- STEP #7
COMMIT;

-- Session #2
-- STEP #2
BEGIN;
-- STEP #4
UPDATE pizzeria
SET rating = 2
WHERE id = 2;
-- STEP #6
UPDATE pizzeria
SET rating = 2
WHERE id = 1;
-- STEP #8
COMMIT;