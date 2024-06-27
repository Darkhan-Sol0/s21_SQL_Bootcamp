SELECT 
  person.name,
  menu.pizza_name,
  menu.price,
  ROUND(menu.price - (menu.price * person_discounts.discount / 100), 2) AS discount_price,
  pizzeria.name AS pizzeria_name
FROM person_order
  JOIN person
    ON person_order.person_id = person.id
  JOIN menu
    ON person_order.menu_id = menu.id
  JOIN person_discounts
    ON person_discounts.person_id = person.id AND
       person_discounts.pizzeria_id = menu.pizzeria_id
  JOIN pizzeria
    ON person_discounts.pizzeria_id = pizzeria.id
ORDER BY person.name, menu.pizza_name;
