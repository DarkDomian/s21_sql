CREATE FUNCTION fnc_persons(pgender varchar DEFAULT 'female') 
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) 
AS $$
	SELECT * FROM person
	WHERE gender = pgender;
$$ LANGUAGE SQL;

-- check with default value
SELECT * FROM fnc_persons();

-- check with custom value
SELECT * FROM fnc_persons(pgender:='male');