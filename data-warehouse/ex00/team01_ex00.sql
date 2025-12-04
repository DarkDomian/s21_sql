WITH last_currency AS (
	SELECT DISTINCT ON (id)
		id,
		name,
		rate_to_usd,
		updated
    FROM currency
    ORDER BY id, updated DESC
)

SELECT 
	COALESCE(ur.name, 'not defined') AS name,
	COALESCE(ur.lastname, 'not defined') AS lastname,
	bl.type,
	SUM(bl.money) AS volume,
	COALESCE(lc.name, 'not defined') AS currency_name,
	COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
	ROUND((SUM(bl.money) * COALESCE(lc.rate_to_usd, 1)), 0) AS total_volume_id_usd
FROM "user" ur
FULL JOIN balance bl ON bl.user_id = ur.id
FULL JOIN last_currency lc ON bl.currency_id = lc.id 
GROUP BY ur.name, ur.lastname, bl.type, lc.name, lc.rate_to_usd
ORDER BY 1 DESC, 2 , 3;