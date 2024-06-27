CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $trg_person_delete_audit$
  BEGIN
    INSERT INTO person_audit 
      VALUES (NOW(), 'D', OLD.*);
    RETURN NULL;
  END;
$trg_person_delete_audit$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
  FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
