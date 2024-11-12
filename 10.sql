SELECT 
    start.machine_id,  -- Selects `machine_id` from the `start` alias, representing the unique identifier of each machine
    
    ROUND(AVG(end.timestamp - start.timestamp), 3) AS processing_time  
    -- Calculates the average time difference between `end` and `start` timestamps for each `machine_id`.
    -- `end.timestamp - start.timestamp` computes the time interval between "start" and "end" activities for each pair of rows.
    -- `AVG(...)` calculates the average of these time intervals for each machine.
    -- `ROUND(..., 3)` rounds the result to three decimal places for better readability and precision.

FROM Activity AS start  -- Sets the main table as `Activity` with an alias `start` to represent "start" activities

-- Subquery to filter and select only "end" activities from the `Activity` table
JOIN (
    SELECT process_id, machine_id, timestamp
    FROM Activity
    WHERE activity_type = "end"  -- Filters the subquery to include only "end" activities
) AS end 
-- Joins `end` subquery with `start` on matching `process_id` and `machine_id`
ON start.process_id = end.process_id 
AND start.machine_id = end.machine_id

WHERE start.activity_type = "start"  -- Filters the main `Activity` table to include only "start" activities

GROUP BY start.machine_id;  -- Groups the results by `machine_id`, so that the average processing time is calculated for each unique machine
