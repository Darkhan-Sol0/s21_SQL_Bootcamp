CREATE TABLE person_audit (
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  type_event CHAR(1) NOT NULL DEFAULT 'I',
  row_id bigint NOT NULL,
  name VARCHAR,
  age INTEGER,
  gender VARCHAR,
  address VARCHAR,
  CONSTRAINT ch_type_event CHECK (type_event in ('I', 'D', 'U'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
  BEGIN
    INSERT INTO person_audit 
      VALUES (NOW(), 'I', NEW.*);
    RETURN NULL;
  END;
$trg_person_insert_audit$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');