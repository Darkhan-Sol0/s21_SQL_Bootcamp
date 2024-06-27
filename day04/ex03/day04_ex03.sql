SELECT generated_date AS missing_date
FROM  v_generated_dates
WHERE NOT EXISTS (
    SELECT visit_date
    FROM person_visits
    WHERE visit_date = v_generated_dates.generated_date
    AND visit_date BETWEEN '2022-01-01' AND '2022-01-31'
)
ORDER BY missing_date;