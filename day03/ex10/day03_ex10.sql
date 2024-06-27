INSERT INTO person_order
VALUES ((SELECT max(id) + 1
        FROM person_order),
        (SELECT id
        FROM person
        WHERE name = 'Andrey'),
        (SELECT id
        FROM menu
        WHERE pizza_name = 'sicilian pizza'),
        CAST('2022-02-24' AS DATE));

INSERT INTO person_order
VALUES ((SELECT max(id) + 1
        FROM person_order),
        (SELECT id
        FROM person
        WHERE name = 'Irina'),
        (SELECT id
        FROM menu
        WHERE pizza_name = 'sicilian pizza'),
        CAST('2022-02-24' AS DATE));