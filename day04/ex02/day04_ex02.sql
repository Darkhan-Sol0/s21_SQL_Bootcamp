CREATE VIEW v_generated_dates AS
    SELECT CAST(generated_date AS DATE)
    FROM GENERATE_SERIES(
        CAST('2022-01-01' AS DATE),
        CAST('2022-01-31' AS DATE),
        '1 day'
    ) AS generated_date