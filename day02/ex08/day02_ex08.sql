SELECT name
FROM person
    JOIN person_order 
        ON person.id = person_id
    JOIN menu 
        ON menu_id = menu.id
WHERE address IN ('Moscow', 'Samara')
    AND gender = 'male'
    AND pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;