CREATE OR REPLACE FUNCTION fnc_rate(curr int, upt timestamp)
RETURNS numeric 
LANGUAGE SQL
AS $$
    (
        SELECT rate_to_usd, updated
        FROM currency
        WHERE id = curr AND updated < upt
        ORDER BY updated DESC
        LIMIT 1
    )
    UNION ALL
    (
        SELECT rate_to_usd, updated
        FROM currency
        WHERE id = curr AND updated > upt
        ORDER BY updated
        LIMIT 1
    )
    LIMIT 1;
SELECT COALESCE((SELECT rate_to_usd FROM past_rate), (SELECT rate_to_usd FROM future_rate));
$$;

SELECT 
    COALESCE("user".name, 'not defined') AS name, 
    COALESCE("user".lastname, 'not defined') AS lastname, 
    temp_curr.name AS currency_name,
    money * fnc_rate(currency_id, balance.updated) AS currency_in_usd, 
    updated
FROM balance
FULL JOIN "user" ON "user".id = balance.user_id
JOIN (SELECT DISTINCT id, name FROM currency) AS temp_curr ON temp_curr.id = balance.currency_id
ORDER BY name DESC, lastname, currency_name;
