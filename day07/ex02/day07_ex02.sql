WITH visits_orders_per AS (
  (SELECT 
    pizzeria.name,
    COUNT(*) AS count,
    'visit' AS action_type
  FROM pizzeria
    JOIN person_visits
      ON pizzeria.id = person_visits.pizzeria_id
  GROUP BY pizzeria.name
  ORDER BY count DESC
  LIMIT 3)
  UNION
  (SELECT 
    pizzeria.name,
    COUNT(*) AS count,
    'order' AS action_type
  FROM pizzeria
    JOIN menu
      ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
      ON menu.id = person_order.menu_id
  GROUP BY pizzeria.name
  ORDER BY count DESC
  LIMIT 3)
)

SELECT *
FROM visits_orders_per
ORDER BY visits_orders_per.action_type ASC, visits_orders_per.count DESC;