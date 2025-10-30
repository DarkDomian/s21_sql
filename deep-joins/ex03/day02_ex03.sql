WITH
been_dates AS (
	SELECT DISTINCT visit_date AS been_date
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2
),
all_dates AS (
	SELECT DISTINCT visit_date
	FROM person_visits
)

SELECT visit_date AS missing_date
FROM been_dates bd
RIGHT JOIN all_dates ad ON bd.been_date = ad.visit_date
WHERE been_date IS NULL
ORDER BY missing_date; 