CREATE TABLE towns (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO towns VALUES 
('a', 'b', 10),
('a', 'c', 15),
('a', 'd', 20),
('b', 'a', 10),
('b', 'c', 35),
('b', 'd', 25),
('c', 'a', 15),
('c', 'b', 35),
('c', 'd', 30),
('d', 'a', 20),
('d', 'b', 25),
('d', 'c', 30);

CREATE MATERIALIZED VIEW possible_tours AS (
    WITH RECURSIVE
		number_of_towns AS (
			SELECT COUNT(DISTINCT point1) AS num 
			FROM towns
		),
        paths AS (
            SELECT 
                point2 AS current,
                cost AS total_cost,
                array[point1, point2] AS tour
            FROM towns
            WHERE point1 = 'a'
            UNION ALL
            SELECT
                t.point2 AS current,
                p.total_cost + t.cost AS total_cost,
                array_append(tour, t.point2) 
            FROM paths p
            INNER JOIN towns t ON p.current = t.point1
            WHERE
                NOT (t.point2 = ANY(tour))
                OR (
                    array_length(tour, 1) = (SELECT * FROM number_of_towns)
                    AND t.point2 = 'a'
                )
        )
    SELECT 
        total_cost,
        tour
    FROM paths, number_of_towns
	WHERE array_length(tour, 1) > number_of_towns.num
);

SELECT *
FROM possible_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM possible_tours)
ORDER BY total_cost, tour;