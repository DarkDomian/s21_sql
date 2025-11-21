DROP VIEW IF EXISTS full_way;
DROP TABLE IF EXISTS hamiltonian_cycle;

CREATE TABLE hamiltonian_cycle (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT into hamiltonian_cycle VALUES 
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

CREATE VIEW full_way AS (
    WITH RECURSIVE
        paths AS (
            SELECT 
                point2 AS current,
                cost AS total_cost,
                array[point1, point2] AS tour
            FROM hamiltonian_cycle
            WHERE point1 = 'a'
            UNION ALL
            SELECT
                c.point2 AS current,
                p.total_cost + c.cost AS total_cost,
                array_append(tour, c.point2) 
            FROM paths p
            INNER JOIN hamiltonian_cycle c ON 
                p.current = c.point1
                AND (
                    NOT (c.point2 = ANY(tour))
                    OR (
                        array_length(tour, 1) = (
                            SELECT COUNT(DISTINCT point1) 
                            FROM hamiltonian_cycle
                        )
                        AND c.point2 = 'a'
                    )
                )
        ),
        full_paths AS (
            SELECT *
            FROM paths
            WHERE 
                array_length(tour, 1) > (
                    SELECT COUNT(DISTINCT point1) 
                    FROM hamiltonian_cycle
                )
        )
    SELECT 
        total_cost,
        tour
    FROM full_paths);

SELECT *
FROM full_way
WHERE total_cost = (SELECT MIN(total_cost) FROM full_way)
ORDER BY total_cost, tour;