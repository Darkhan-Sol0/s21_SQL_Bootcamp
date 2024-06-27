SELECT pizza_name,
       pizzeria.name AS pizzeria_name, 
       price
FROM menu
    JOIN pizzeria 
        ON pizzeria_id = pizzeria.id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name ASC, pizzeria_name ASC;