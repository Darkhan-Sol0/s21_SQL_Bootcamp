-- SELECT
--   address,
--   ROUND(MAX(age) - (MIN(age) / MAX(age)), 2) AS formula,
--   ROUND(AVG(age), 2) AS average,
--   CASE
--     WHEN (MAX(age) - (MIN(age) / MAX(age)) > AVG(age)) 
--     THEN 'true'
--     ELSE 'false' 
--   END AS comparison
-- FROM person
-- GROUP BY address
-- ORDER BY address;

-- SELECT
--   address,
--   ROUND(MAX(age) - (MIN(age) / MAX(age)), 2) AS formula,
--   ROUND(AVG(age), 2) AS average,
--   MAX(age) - (MIN(age) / MAX(age)) > AVG(age) AS comparison
-- FROM person
-- GROUP BY address
-- ORDER BY address;

SELECT
  address,
  ROUND(MAX(age) - (MIN(age) / MAX(CAST(age AS NUMERIC))), 2) AS formula,
  ROUND(AVG(age), 2) AS average,
  CASE
    WHEN (MAX(age) - (MIN(age) / MAX(CAST(age AS NUMERIC))) > AVG(age)) 
    THEN TRUE
    ELSE FALSE
  END AS comparison
FROM person
GROUP BY address
ORDER BY address;