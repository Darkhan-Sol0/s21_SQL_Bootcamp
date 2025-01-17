CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
  BEGIN
    INSERT INTO person_audit 
      VALUES (NOW(), 'U', OLD.*);
    RETURN NULL;
  END;
$trg_person_update_audit$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

