SELECT DISTINCT person.name
FROM person_order
    JOIN menu 
        ON menu_id = menu.id
    JOIN person 
        ON person_id = person.id
WHERE person.id IN (
    SELECT person_id
        FROM person_order
            JOIN menu 
                ON menu_id = menu.id
            AND pizza_name IN ('pepperoni pizza', 'cheese pizza')
    GROUP BY person_id
    HAVING COUNT(DISTINCT pizza_name) = 2)
    AND gender = 'female'
ORDER BY person.name;