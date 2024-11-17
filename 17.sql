SELECT 
    Project.project_id, 
    -- Calculate the average experience in years for employees in each project.
    -- SUM(Employee.experience_years): Sum of all employees' experience years for the project.
    -- COUNT(Project.employee_id): Total number of employees in the project.
    -- ROUND(..., 2): Round the result to 2 decimal places.
    ROUND((SUM(Employee.experience_years) / COUNT(Project.employee_id)), 2) AS average_years
FROM 
    Project
-- LEFT JOIN ensures all projects are included, even if there are no matching employees.
LEFT JOIN 
    Employee
ON 
    -- Match employee IDs between the Project and Employee tables.
    Project.employee_id = Employee.employee_id
GROUP BY 
    -- Group by project_id so the calculations (sum, count) are done per project.
    Project.project_id;
