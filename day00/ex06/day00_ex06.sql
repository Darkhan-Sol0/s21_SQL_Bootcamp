SELECT 
    (SELECT name 
    FROM person
    WHERE person.id = person_order.person_id) AS name,
    CASE
        WHEN (SELECT name FROM person WHERE person.id = person_order.person_id) = 'Denis' THEN 'true'
        ELSE 'false'
    END check_name
FROM person_order
WHERE (menu_id='13' OR menu_id='14' OR menu_id='18') AND (order_date='07-01-2022');