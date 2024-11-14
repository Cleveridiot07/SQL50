SELECT 
    s.user_id, 
    COALESCE(ROUND(SUM(c.action = 'confirmed') / COUNT(c.action), 2), 0) AS confirmation_rate 
FROM 
    Signups s
LEFT JOIN 
    Confirmations c 
ON 
    s.user_id = c.user_id
GROUP BY 
    s.user_id;

SELECT s.user_id,

-- Selects the user_id from the Signups table (s) for output.
-- COALESCE(ROUND(SUM(c.action = 'confirmed') / COUNT(c.action), 2), 0) AS confirmation_rate

-- Calculates the confirmation_rate for each user. The calculation is:
-- SUM(c.action = 'confirmed'): Counts the number of times a user has an action marked as 'confirmed'.
-- This works because in SQL, conditions like (c.action = 'confirmed') return 1 if TRUE and 0 if FALSE.
-- COUNT(c.action): Counts all actions for each user, including confirmed and others, but excluding any NULL actions.
-- SUM(c.action = 'confirmed') / COUNT(c.action): Gives the proportion of confirmed actions for that user.
-- ROUND(..., 2): Rounds this calculated confirmation rate to two decimal places.
-- COALESCE(..., 0): Ensures that if SUM(c.action = 'confirmed') / COUNT(c.action) is NULL (meaning there are no actions for the user), it defaults to 0 instead of returning NULL.
-- Explanation of COALESCE:
-- COALESCE is a function that takes multiple arguments and returns the first non-NULL value.
-- In this query, COALESCE(..., 0) returns the calculated confirmation_rate if it’s not NULL. If it is NULL (i.e., no records in Confirmations for a user), COALESCE returns 0.
-- FROM Signups s

-- Specifies the main table (Signups) for the query and assigns it an alias (s).
-- LEFT JOIN Confirmations c ON s.user_id = c.user_id

-- Left joins the Confirmations table (c) to the Signups table (s) based on user_id.
-- This join includes all users from Signups, even if they have no corresponding records in Confirmations.
-- GROUP BY s.user_id

-- Groups the result by each unique user_id to calculate the confirmation_rate per user.