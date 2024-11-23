SELECT 
    activity_date AS day, -- Selects the activity date and renames it as 'day'
    COUNT(DISTINCT user_id) AS active_users -- Counts the unique user IDs for each activity date
FROM 
    Activity -- Data source: the 'Activity' table
WHERE 
    (activity_date > "2019-06-27" AND activity_date <= "2019-07-27") 
    -- Filters rows where 'activity_date' is strictly after June 27, 2019, 
    -- and on or before July 27, 2019 (inclusive of July 27)
GROUP BY 
    activity_date; -- Groups the results by each 'activity_date' to compute distinct active users per day
