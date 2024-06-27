SELECT COALESCE(person.name, '-') AS person_name,
       visit_date,
       COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM person
LEFT JOIN person_visits
      ON person_id = person.id
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL JOIN pizzeria
      ON pizzeria_id = pizzeria.id
ORDER BY person_name ASC, visit_date ASC, pizzeria_name ASC;