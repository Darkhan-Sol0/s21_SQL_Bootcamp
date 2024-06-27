INSERT INTO person_visits
VALUES ((SELECT max(id) + 1
        FROM person_visits),
        (SELECT id
        FROM person
        WHERE name = 'Andrey'),
        (SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'),
        CAST('2022-02-24' AS DATE));

INSERT INTO person_visits
VALUES ((SELECT max(id) + 1
        FROM person_visits),
        (SELECT id
        FROM person
        WHERE name = 'Irina'),
        (SELECT id
        FROM pizzeria
        WHERE name = 'Dominos'),
        CAST('2022-02-24' AS DATE));