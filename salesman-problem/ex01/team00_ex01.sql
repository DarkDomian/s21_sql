SELECT * FROM possible_tours
WHERE 
    total_cost = (SELECT MIN(total_cost) FROM possible_tours)
    OR total_cost = (SELECT MAX(total_cost) FROM possible_tours)
ORDER BY total_cost, tour;