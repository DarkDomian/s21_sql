-- Disable sequential scan to force index usage. Remember to enable it back!
SET enable_seqscan = OFF;

-- The query planner prefers sequential scan over index scan for this query
-- Reason: With small table sizes, the overhead of index lookup exceeds benefits
-- of full table scan. Indexes become beneficial with larger datasets.
SELECT pizza_name, pz.name AS pizzeria_name
FROM menu mn
JOIN pizzeria pz ON mn.pizzeria_id = pz.id;

SET enable_seqscan = ON;