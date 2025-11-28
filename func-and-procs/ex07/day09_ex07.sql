CREATE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric AS $$
DECLARE
    min_val numeric;
    i numeric;
BEGIN
	IF array_length(arr, 1) IS NULL THEN
    	RETURN NULL;
	END IF;
	
    min_val := arr[1];
    
    FOREACH i IN ARRAY arr LOOP
        IF i < min_val THEN
            min_val := i;
        END IF;
    END LOOP;
    
    RETURN min_val;
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);