SELECT *
FROM full_way
WHERE 
    total_cost = (SELECT MIN(total_cost) FROM full_way)
    OR total_cost = (SELECT MAX(total_cost) FROM full_way)
ORDER BY total_cost, tour;

DROP VIEW IF EXISTS full_way;