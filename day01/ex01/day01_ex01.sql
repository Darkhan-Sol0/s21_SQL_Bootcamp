SELECT object_name
FROM 
    (SELECT name AS object_name, 1 AS pri
    FROM person
    UNION ALL
    SELECT pizza_name AS object_name, 2 AS pri
    FROM menu) AS object_p
ORDER BY object_p.pri ASC, object_p.object_name ASC;