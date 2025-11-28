-- DROP FUNCTIONS, TRIGGERS AND DATA
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;

DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

TRUNCATE TABLE person_audit;

-- BUILD GENERIC AUDIT TRIGGER AND FUNCTION 
CREATE FUNCTION fnc_trg_person_audit() 
RETURNS TRIGGER 
AS $$
BEGIN
	INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
	VALUES (
		LEFT(TG_OP, 1),
		COALESCE(OLD.id, NEW.id),
		COALESCE(OLD.name, NEW.name),
		COALESCE(OLD.age, NEW.age),
		COALESCE(OLD.gender, NEW.gender),
		COALESCE(OLD.address, NEW.address)
	);

    RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

-- AFTER ALL
INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
 
DELETE FROM person WHERE id = 10;