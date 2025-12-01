CREATE OR REPLACE FUNCTION fnc_rate(curr int, upt timestamp)
RETURNS numeric 
LANGUAGE SQL
AS $$
WITH 
    past_rate AS (
        SELECT rate_to_usd, updated
        FROM currency
        WHERE id = curr AND updated < upt
        ORDER BY updated DESC
        LIMIT 1
    ),
    future_rate AS (
        SELECT rate_to_usd, updated
        FROM currency
        WHERE id = curr AND updated > upt
        ORDER BY updated
        LIMIT 1
    )
SELECT COALESCE((SELECT rate_to_usd FROM past_rate), (SELECT rate_to_usd FROM future_rate));
$$;