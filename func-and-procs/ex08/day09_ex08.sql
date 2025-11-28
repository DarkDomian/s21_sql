CREATE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE(fib_number integer) AS $$
DECLARE
    a integer := 0;
    b integer := 1;
BEGIN
    WHILE a < pstop LOOP
        fib_number := a;
        RETURN NEXT;
        SELECT b, a + b INTO a, b;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();