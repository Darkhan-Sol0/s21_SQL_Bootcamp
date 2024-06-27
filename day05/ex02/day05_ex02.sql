CREATE INDEX idx_person_name ON person(UPPER(name));

SET ENABLE_SEQSCAN = OFF;
EXPLAIN ANALYZE
SELECT *
FROM person_order
  JOIN person
    ON person_order.person_id = person.id;
