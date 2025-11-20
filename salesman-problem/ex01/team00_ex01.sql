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
        WHERE 
            NOT (c.point2 = ANY(tour))
            OR (
                array_length(tour, 1) = (
                    SELECT COUNT(DISTINCT point1) 
                    FROM hamiltonian_cycle
                )
                AND c.point2 = 'a'
            )
    ),
    full_paths AS (
        SELECT *
        FROM paths
        WHERE 
            array_length(tour, 1) = (
                SELECT COUNT(DISTINCT point1) 
                FROM hamiltonian_cycle
            ) + 1
    )
SELECT *
FROM full_paths
WHERE 
	total_cost = (SELECT MIN(total_cost) FROM full_paths)
    OR total_cost = (SELECT MAX(total_cost) FROM full_paths)
ORDER BY total_cost, tour;