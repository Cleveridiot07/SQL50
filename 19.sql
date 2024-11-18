SELECT 
    subquery.query_name, -- Selects the query_name from the first subquery.
    subquery.quality,    -- Selects the calculated quality score from the first subquery.
    p.poor_query_percentage -- Selects the poor query percentage from the second subquery.
FROM 
    (
        -- First subquery: Calculates the "quality" score for each query_name.
        SELECT 
            q.query_name, 
            ROUND(AVG(q.rating / q.position), 2) AS quality -- Computes average of rating/position, rounded to 2 decimals.
        FROM 
            Queries AS q -- Uses the Queries table.
        GROUP BY 
            q.query_name -- Groups results by query_name to compute the average per query.
    ) AS subquery -- The first subquery is aliased as 'subquery'.
JOIN (
        -- Second subquery: Calculates the "poor query percentage" for each query_name.
        SELECT 
            q.query_name,
            ROUND((SUM(q.rating < 3) * 100.0) / COUNT(*), 2) AS poor_query_percentage 
            -- SUM(q.rating < 3): Counts how many rows have a rating less than 3 (true evaluates to 1).
            -- COUNT(*): Total number of rows for that query_name.
            -- Calculates percentage of "poor" ratings and rounds to 2 decimals.
        FROM 
            Queries AS q -- Uses the same Queries table.
        GROUP BY 
            q.query_name -- Groups results by query_name to compute the percentage per query.
    ) AS p -- The second subquery is aliased as 'p'.
ON 
    subquery.query_name = p.query_name -- Joins the two subqueries based on query_name.
;
