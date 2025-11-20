WITH RECURSIVE paths as (
    SELECT 
        point1 as start,
        point2 as current,
        cost as total_cost,
        array[point1, point2] as tour
    FROM city
    WHERE point1 = 'a'
    UNION ALL
    SELECT 
        p.start as start,
        c.point2 as current,
        p.total_cost + c.cost as total_cost,
        array_append(tour, c.point2) 
    FROM paths p
    JOIN city c ON p.current = c.point1
    WHERE 
        NOT (c.point2 = ANY(tour)) 
        OR (
            array_length(tour, 1) = (SELECT COUNT(DISTINCT point1) FROM city) 
            AND c.point2 = 'a'
        )
),
total_paths as (
    SELECT 
        total_cost,
        tour
    FROM paths
    WHERE 
        array_length(tour, 1) = (SELECT COUNT(DISTINCT point1) FROM city) + 1
)
SELECT *
FROM total_paths
WHERE 
    total_cost = (SELECT MIN(total_cost) FROM total_paths) 
    OR total_cost = (SELECT MAX(total_cost) FROM total_paths)
ORDER BY total_cost, tour;