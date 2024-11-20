SELECT 
    -- Calculate the average fraction of players logging in the day after their first activity
    ROUND(SUM(player_login) / COUNT(DISTINCT player_id), 2) AS fraction
FROM 
    (
        -- Subquery: Determine if each player logged in the day after their first activity
        SELECT 
            player_id,
            -- Check if the difference between the current event_date and the player's first event_date is 1 day
            DATEDIFF(event_date, MIN(event_date) OVER(PARTITION BY player_id)) = 1 AS player_login
        FROM 
            activity
    ) AS new_table;
