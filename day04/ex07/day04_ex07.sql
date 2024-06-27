INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(id) + 1 
        FROM person_visits),
    (SELECT id 
        FROM person
        WHERE name = 'Dmitriy'),
    (SELECT DISTINCT pizzeria.id
    FROM pizzeria
        JOIN mv_dmitriy_visits_and_eats
            ON pizzeria.name != mv_dmitriy_visits_and_eats.name
        JOIN menu
            ON pizzeria.id = menu.pizzeria_id
    WHERE menu.price < 800 LIMIT 1),
    CAST('2022-01-08' AS DATE));

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;