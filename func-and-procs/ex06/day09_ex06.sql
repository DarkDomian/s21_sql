CREATE FUNCTION fnc_person_visits_and_eats_on_date(
	pperson varchar DEFAULT 'Dmitriy',
	pprice integer DEFAULT 500,
	pdate date DEFAULT '2022-01-08'
) RETURNS TABLE(pizziria_name varchar) 
AS $$
BEGIN
	RETURN QUERY
	SELECT DISTINCT pz.name AS pizzeria_name
	FROM person_visits pv
	JOIN person pn ON pv.person_id = pn.id
	JOIN pizzeria pz ON pv.pizzeria_id = pz.id
	JOIN menu mn ON mn.pizzeria_id = pz.id
	WHERE pn.name = pperson
		AND pv.visit_date = pdate
		AND mn.price < pprice;
END;
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);


select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');