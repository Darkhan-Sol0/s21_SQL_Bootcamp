CREATE OR REPLACE FUNCTION fnc_fibonacci(max INTEGER DEFAULT 10) 
  RETURNS TABLE (
    val INTEGER
  ) AS $$
  WITH RECURSIVE rec AS (
    SELECT 
    0 AS val,
    1 AS temp
    UNION
    SELECT 
    temp,
    val + temp
    FROM rec
    WHERE temp < max)
  SELECT val 
  FROM rec;
  
$$ LANGUAGE SQL;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();