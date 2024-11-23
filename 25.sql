WITH FirstYear AS (
    SELECT 
        product_id, 
        MIN(year) AS first_year -- Step 1: Get the earliest year for each product
    FROM 
        Sales
    GROUP BY 
        product_id -- Step 2: Group by product_id to calculate the MIN(year) for each product
)
SELECT 
    s.product_id,          -- Step 6: Retrieve the product_id
    f.first_year,          -- Step 7: Retrieve the first year (calculated in the CTE)
    s.quantity,            -- Step 8: Retrieve the quantity for the first year
    s.price                -- Step 9: Retrieve the price for the first year
FROM 
    FirstYear f            -- Step 3: Use the results from the CTE
JOIN 
    Sales s                -- Step 4: Join the CTE with the Sales table
ON 
    s.product_id = f.product_id    -- Step 5: Match product_id between the CTE and Sales table
    AND s.year = f.first_year;     -- Step 5 (cont.): Match the year with the first year from the CTE
