SELECT person_id
FROM person_order
WHERE order_date = CAST('2022-01-07' AS DATE)
EXCEPT ALL
SELECT person_id
FROM person_visits
WHERE visit_date = CAST('2022-01-07' AS DATE);