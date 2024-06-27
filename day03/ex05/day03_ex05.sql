WITH
    get_pizzeria AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_visits
        JOIN person
            ON person_visits.person_id = person.id
        JOIN pizzeria
            ON person_visits.pizzeria_id = pizzeria.id
        WHERE person.name = 'Andrey'),
    
    get_order AS (
        SELECT pizzeria.name AS pizzeria_name
        FROM person_order
        JOIN person
            ON person_order.person_id = person.id
        JOIN menu
            ON person_order.menu_id = menu.id
        JOIN pizzeria
            ON menu.pizzeria_id = pizzeria.id 
        WHERE person.name = 'Andrey')

SELECT pizzeria_name
FROM (SELECT pizzeria_name FROM get_pizzeria
        EXCEPT ALL
        SELECT pizzeria_name FROM get_order)
ORDER BY pizzeria_name;