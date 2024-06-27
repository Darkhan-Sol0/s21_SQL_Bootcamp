WITH
    get_male AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_order
        JOIN menu
            ON person_order.menu_id = menu.id
        JOIN pizzeria
            ON menu.pizzeria_id = pizzeria.id
        JOIN person
            ON person_order.person_id = person.id
        WHERE gender = 'male'),
    get_female AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_order
        JOIN menu
            ON person_order.menu_id = menu.id
        JOIN pizzeria
            ON menu.pizzeria_id = pizzeria.id
        JOIN person person
            ON person_order.person_id = person.id
        WHERE gender = 'female')

SELECT pizzeria_name
FROM (SELECT pizzeria_name FROM get_male
        EXCEPT
        SELECT pizzeria_name FROM get_female)
UNION
SELECT pizzeria_name
FROM (SELECT pizzeria_name FROM get_female
        EXCEPT
        SELECT pizzeria_name FROM get_male)
ORDER BY pizzeria_name;