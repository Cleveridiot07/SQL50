SELECT Employee.name, Bonus.bonus  
-- Selects two columns: `name` from the `Employee` table and `bonus` from the `Bonus` table.
-- `name` represents the employee's name, and `bonus` is the amount of bonus awarded to the employee.

FROM Employee  -- Specifies the main table, `Employee`, which is the source for employee information.

LEFT JOIN Bonus  -- Performs a LEFT JOIN between the `Employee` table and the `Bonus` table.
-- The LEFT JOIN ensures that all rows from the `Employee` table are included in the result set.
-- Even if there's no matching row in the `Bonus` table (i.e., no bonus for the employee), the employee's information will still appear in the result, with `bonus` set to `NULL`.

ON Employee.empId = Bonus.empId  
-- The join condition specifies that the tables should be matched based on the `empId` column, 
-- which uniquely identifies each employee in both the `Employee` and `Bonus` tables.

WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL  
-- Filters the result set to include only those employees whose bonus is either:
-- 1. Less than 1000 (`Bonus.bonus < 1000`), or
-- 2. `NULL` (`Bonus.bonus IS NULL`), which means the employee does not have a bonus in the `Bonus` table.

