
-- Selects the columns `unique_id` from the `EmployeeUNI` table and `name` from the `Employees` table
SELECT unique_id, name
FROM Employees 
-- Performs a LEFT JOIN between the `Employees` table and the `EmployeeUNI` table
-- The join is based on the matching values of `id` in both tables
LEFT JOIN EmployeeUNI
ON Employees.id = EmployeeUNI.id;
-- Returns all records from the `Employees` table, regardless of whether there is a matching `id` in the `EmployeeUNI` table
-- If a match is found in `EmployeeUNI`, the `unique_id` value is included; if not, it returns NULL for `unique_id`


