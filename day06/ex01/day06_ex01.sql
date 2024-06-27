INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
WITH count_person_orders AS (
  SELECT 
    person_order.person_id, 
    menu.pizzeria_id,
    COUNT(person_order.person_id) AS count_orders
  FROM person_order
    JOIN menu
      ON person_order.menu_id = menu.id
  GROUP BY person_order.person_id, menu.pizzeria_id
  ORDER BY person_order.person_id
)
SELECT
  ROW_NUMBER( ) OVER ( ) AS id,
  count_person_orders.person_id,
  count_person_orders.pizzeria_id,
  CASE 
    WHEN count_person_orders.count_orders = 1 THEN 10.5
    WHEN count_person_orders.count_orders = 2 THEN 22
    ELSE 30 
  END AS discount
  FROM count_person_orders;