SELECT pizzeria.name
FROM pizzeria
    JOIN menu 
        ON pizzeria.id = menu.pizzeria_id
    JOIN person_visits 
        ON pizzeria.id = person_visits.pizzeria_id
    JOIN person 
        ON person_visits.person_id = person.id
WHERE price < 800
    AND person.name = 'Dmitriy'
    AND visit_date = '2022-01-08';