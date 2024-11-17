SELECT 
    R.contest_id, 
    -- Calculate the percentage of registered users for each contest:
    -- (Count of users registered for the contest / Total users in the Users table) * 100.
    ROUND((COUNT(R.user_id) * 100.0) / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM 
    Register AS R
LEFT JOIN 
    Users AS U
ON 
    -- Match the `user_id` from the Register table with the Users table for additional information.
    U.user_id = R.user_id
GROUP BY 
    R.contest_id
    -- Group by contest_id to calculate statistics for each contest separately.
ORDER BY 
    percentage DESC, 
    contest_id;
    -- Order the results by percentage in descending order and by contest_id for tie-breaking.
