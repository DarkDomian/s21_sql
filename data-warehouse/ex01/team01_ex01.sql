SELECT DISTINCT
    COALESCE("user".name, 'not defined') AS name, 
    COALESCE("user".lastname, 'not defined') AS lastname, 
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
FULL JOIN "user" ON "user".id = b.user_id
JOIN currency c ON c.id = b.currency_id
ORDER BY name DESC, lastname, currency_name;