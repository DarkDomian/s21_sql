-- init salesman table
CREATE TABLE salesman_graph
(
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INTEGER NOT NULL
);

INSERT INTO salesman_graph VALUES
('b', 'a', 10),
('a', 'b', 10),
('b', 'd', 25),
('d', 'b', 25),
('b', 'c', 35),
('c', 'b', 35),
('a', 'd', 20),
('d', 'a', 20),
('a', 'c', 15),
('c', 'a', 15),
('d', 'c', 30),
('c', 'd', 30);

WITH RECURSIVE hamiltonian_cycle
AS (
	-- Base (anchor) query here
	SELECT 
		point1,
		point2,
		cost,
		0 AS total_cost,
		ARRAY[point1] AS path
	FROM salesman_graph sg
	WHERE sg.point1 = 'a'

	UNION ALL
	-- Recursive query here
	SELECT 
		sg.point1,
		sg.point2,
		sg.cost,
		hc.total_cost + hc.cost,
		array_append(path, sg.point1)
	FROM salesman_graph sg
	INNER JOIN hamiltonian_cycle hc 
		ON hc.point2 = sg.point1
		AND hc.point1 != sg.point2
		AND (
            array_length(hc.path, 1) < 4
            OR sg.point1 = 'a'
        )
	WHERE array_length(path, 1) < 5
)
-- add alias 

SELECT DISTINCT total_cost, path AS tour
FROM hamiltonian_cycle
WHERE array_length(path, 1) = 5;








