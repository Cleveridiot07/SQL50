-- SQL Interval Notes

-- 1. Subtracting 1 year from the current date
-- The `INTERVAL 1 YEAR` subtracts 1 year from the current date (CURRENT_DATE).
SELECT CURRENT_DATE - INTERVAL 1 YEAR;

-- 2. Adding 6 months to the current date
-- `INTERVAL 6 MONTH` adds 6 months to the current date.
SELECT CURRENT_DATE + INTERVAL 6 MONTH;

-- 3. Subtracting 3 days from a specific date
-- Here, we subtract 3 days from the date '2024-11-12' using `INTERVAL 3 DAY`.
SELECT '2024-11-12' - INTERVAL 3 DAY;

-- 4. Adding 5 hours to the current timestamp
-- `INTERVAL 5 HOUR` adds 5 hours to the current timestamp (CURRENT_TIMESTAMP).
SELECT CURRENT_TIMESTAMP + INTERVAL 5 HOUR;

-- 5. Adding 1 week to the current date
-- `INTERVAL 1 WEEK` adds 1 week (7 days) to the current date.
SELECT CURRENT_DATE + INTERVAL 1 WEEK;

-- 6. Subtracting 10 minutes from the current time
-- The `INTERVAL 10 MINUTE` subtracts 10 minutes from the current time.
SELECT CURRENT_TIME - INTERVAL 10 MINUTE;

-- 7. Adding 2 seconds to the current time
-- `INTERVAL 2 SECOND` adds 2 seconds to the current time.
SELECT CURRENT_TIME + INTERVAL 2 SECOND;

-- 8. Subtracting 1 quarter (3 months) from the current date
-- `INTERVAL 1 QUARTER` subtracts 3 months (a quarter) from the current date.
-- Note: This works in MySQL and PostgreSQL.
SELECT CURRENT_DATE - INTERVAL 1 QUARTER;

-- 9. Subtracting 5 days from a specific date (SQL Server equivalent)
-- SQL Server uses `DATEADD` instead of `INTERVAL`.
-- The function `DATEADD(DAY, -5, '2024-11-12')` subtracts 5 days from '2024-11-12'.
SELECT DATEADD(DAY, -5, '2024-11-12');

-- 10. Adding 3 months to a specific date (SQL Server equivalent)
-- SQL Server's `DATEADD` function adds 3 months to '2024-11-12'.
SELECT DATEADD(MONTH, 3, '2024-11-12');

-- 11. Subtracting 1 hour from the current timestamp (Oracle equivalent)
-- Oracle uses `INTERVAL` but the syntax differs slightly.
-- Here, we subtract 1 hour from the current date (SYSDATE).
SELECT SYSDATE - INTERVAL '1' HOUR FROM dual;

-- 12. Adding 2 weeks to the current date (Oracle equivalent)
-- This adds 2 weeks (14 days) to the current date using Oracle's `INTERVAL`.
SELECT SYSDATE + INTERVAL '2' WEEK FROM dual;

-- 13. Using `INTERVAL` to calculate the date difference
-- Example: Calculate the difference in days between two dates.
-- The result will return an integer value of the number of days between the two dates.
SELECT DATEDIFF('2024-11-12', '2024-11-01') AS days_difference;

-- 14. Example using INTERVAL to compare dates in a WHERE clause
-- Select all records from the `Weather` table where the temperature is greater than the temperature on the previous day.
-- The subquery calculates the temperature of the previous day (1 day before `recordDate`).
SELECT id, recordDate AS curDate
FROM Weather w1
WHERE temperature > (
    SELECT temperature
    FROM Weather w2
    WHERE w2.recordDate = w1.recordDate - INTERVAL 1 DAY
);

-- 15. Adding 1 year to the current date (PostgreSQL and MySQL syntax)
-- `INTERVAL 1 YEAR` adds 1 year to the current date.
SELECT CURRENT_DATE + INTERVAL 1 YEAR;
