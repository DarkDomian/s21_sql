insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT DISTINCT
    COALESCE(usr.name, 'not defined') AS name, 
    COALESCE(usr.lastname, 'not defined') AS lastname, 
    c.name AS currency_name,
    money * COALESCE
    (
        (
            SELECT rate_to_usd
            FROM currency
            WHERE id = b.currency_id AND updated < b.updated
            ORDER BY updated DESC
            LIMIT 1
        ),
        (
            SELECT rate_to_usd
            FROM currency
            WHERE id = b.currency_id AND updated > b.updated
            ORDER BY updated
            LIMIT 1
        )
    ) AS currency_in_usd
FROM balance b
FULL JOIN "user" usr ON usr.id = b.user_id
JOIN currency c ON c.id = b.currency_id
ORDER BY name DESC, lastname, currency_name;