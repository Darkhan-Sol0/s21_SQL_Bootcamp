WITH pizza_pizzeria AS (
    SELECT menu.pizza_name, pizzeria.name, menu.price, menu.id
    FROM menu
    JOIN pizzeria
        ON menu.pizzeria_id = pizzeria.id)

SELECT tab_1.pizza_name, 
        tab_1.name AS pizzeria_name_1,
        tab_2.name AS pizzeria_name_2,
        tab_1.price
FROM pizza_pizzeria AS tab_1
LEFT JOIN pizza_pizzeria AS tab_2
    ON tab_1.pizza_name = tab_2.pizza_name
    AND tab_1.name != tab_2.name
    AND tab_1.price = tab_2.price
WHERE tab_2.name IS NOT NULL AND tab_1.id > tab_2.id
ORDER BY tab_1.pizza_name;
