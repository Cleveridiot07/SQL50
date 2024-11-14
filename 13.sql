SELECT name
FROM Employee
-- The subquery below finds all manager IDs that have five or more employees
JOIN 
(
    SELECT managerId, COUNT(managerId) 
    FROM Employee
    -- Group by managerId to count the number of employees each manager has
    GROUP BY managerId
    -- Use HAVING to filter for managers with at least 5 employees
    HAVING COUNT(managerId) >= 5
) AS subquery
-- Join the main Employee table with the subquery on matching manager IDs
ON Employee.id = subquery.managerId;


-- Optimal Approach
SELECT Employee.name
FROM Employee
JOIN Employee AS subquery
ON Employee.id = subquery.managerId
GROUP BY Employee.id, Employee.name
HAVING COUNT(subquery.id) >= 5;
