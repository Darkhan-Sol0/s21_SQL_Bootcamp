WITH
    get_male AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_visits
        JOIN pizzeria
            ON person_visits.pizzeria_id = pizzeria.id
        JOIN person
            ON person_visits.person_id = person.id
        WHERE gender = 'male'),
    get_female AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_visits
        JOIN pizzeria
            ON person_visits.pizzeria_id = pizzeria.id
        JOIN person person
            ON person_visits.person_id = person.id
        WHERE gender = 'female')

SELECT pizzeria_name
FROM (SELECT pizzeria_name FROM get_male
        EXCEPT ALL
        SELECT pizzeria_name FROM get_female)
UNION ALL
SELECT pizzeria_name
FROM (SELECT pizzeria_name FROM get_female
        EXCEPT ALL
        SELECT pizzeria_name FROM get_male)
ORDER BY pizzeria_name;