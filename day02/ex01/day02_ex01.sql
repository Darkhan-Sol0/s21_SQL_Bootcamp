SELECT CAST(missing_date AS DATE)
FROM GENERATE_SERIES(CAST('2022-01-01' AS DATE),
					 CAST('2022-01-10' AS DATE), 
					 CAST('1 DAY' AS INTERVAL)) AS missing_date
LEFT JOIN (SELECT visit_date, person_id FROM person_visits
		   WHERE (person_id = '1' OR person_id = '2')
		   AND (visit_date BETWEEN '2022-01-01' AND '2022-01-10')
		) ON (missing_date = visit_date)
WHERE visit_date IS NULL
ORDER BY missing_date ASC