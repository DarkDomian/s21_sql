drop table city;

create table city (
    id bigint PRIMARY KEY,
    point1 varchar not null,
    point2 varchar not null,
    cost integer not null
);

INSERT into city VALUES (1, 'a', 'b', 10);
INSERT into city VALUES (2, 'a', 'c', 15);
INSERT into city VALUES (3, 'a', 'd', 20);
INSERT into city VALUES (4, 'b', 'a', 10);
INSERT into city VALUES (5, 'b', 'c', 35);
INSERT into city VALUES (6, 'b', 'd', 25);
INSERT into city VALUES (7, 'c', 'a', 15);
INSERT into city VALUES (8, 'c', 'b', 35);
INSERT into city VALUES (9, 'c', 'd', 30);
INSERT into city VALUES (10, 'd', 'a', 20);
INSERT into city VALUES (11, 'd', 'b', 25);
INSERT into city VALUES (12, 'd', 'c', 30);

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
WHERE total_cost = (SELECT MIN(total_cost) FROM total_paths)
ORDER BY total_cost, tour;