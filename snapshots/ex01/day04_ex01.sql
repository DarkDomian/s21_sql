SELECT name
FROM (
	SELECT * FROM v_persons_female
	UNION
	SELECT * FROM v_persons_male
) AS persons_both_gender
ORDER BY name;