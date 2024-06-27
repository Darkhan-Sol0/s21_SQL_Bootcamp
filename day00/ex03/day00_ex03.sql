SELECT person_id 
FROM person_visits 
WHERE visit_date BETWEEN CAST('6-01-2022' AS DATE) AND CAST('9-01-2022' AS DATE) OR pizzeria_id=2
GROUP BY person_id
ORDER BY person_id DESC;