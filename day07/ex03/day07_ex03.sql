WITH visits_orders_per AS (
  (SELECT 
    pizzeria.name,
    COUNT(*) AS count
  FROM pizzeria
    JOIN person_visits
      ON pizzeria.id = person_visits.pizzeria_id
  GROUP BY pizzeria.name
  ORDER BY count DESC)
  UNION ALL
  (SELECT 
    pizzeria.name,
    COUNT(*) AS count
  FROM pizzeria
    JOIN menu
      ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
      ON menu.id = person_order.menu_id
  GROUP BY pizzeria.name
  ORDER BY count DESC)
)

SELECT 
  visits_orders_per.name,
  SUM(visits_orders_per.count) AS total_count
FROM visits_orders_per
GROUP BY visits_orders_per.name
ORDER BY total_count DESC, visits_orders_per.name ASC;