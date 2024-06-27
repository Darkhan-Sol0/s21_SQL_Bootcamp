SELECT 
    (SELECT name 
    FROM person
    WHERE person.id = pv.person_id) AS person_name,
    (SELECT name
    FROM pizzeria
    WHERE pizzeria.id = pv.pizzeria_id) AS pizzeria_name
FROM 
    (SELECT person_id, pizzeria_id 
    FROM person_visits
    WHERE visit_date BETWEEN CAST('07-01-2022' AS DATE) and CAST('09-01-2022' AS DATE)) AS pv
ORDER BY person_name ASC, pizzeria_name DESC;