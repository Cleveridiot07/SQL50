SELECT 
    MAX(num) AS num -- Step 5: Select the maximum number from the filtered unique numbers
FROM (
    SELECT 
        num -- Step 1: Select the 'num' column
    FROM 
        MyNumbers -- Step 2: Query the table 'MyNumbers'
    GROUP BY 
        num -- Step 3: Group the data by the 'num' column
    HAVING 
        COUNT(num) = 1 -- Step 4: Filter only those numbers that appear exactly once
) AS unique_numbers; -- Step 6: Use this filtered data as a subquery
