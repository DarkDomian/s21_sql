-- create and test function for male
CREATE FUNCTION fnc_persons_male() 
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) 
AS $$
	SELECT * FROM person
	WHERE gender = 'male';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_male();

-- create and test function for female
CREATE FUNCTION fnc_persons_female() 
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar) 
AS $$
	SELECT * FROM person
	WHERE gender = 'female';
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons_female();