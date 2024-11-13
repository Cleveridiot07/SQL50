SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
FROM Students s
-- The CROSS JOIN below ensures that every student will be paired with every subject
CROSS JOIN Subjects sub
-- The LEFT JOIN brings in the Examinations table to count the number of exams attended by each student for each subject
LEFT JOIN Examinations e
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
-- GROUP BY is used to aggregate the counts for each student and subject pair
GROUP BY s.student_id, s.student_name, sub.subject_name
-- We want the results ordered by student_id first, and subject_name second
ORDER BY s.student_id, sub.subject_name;
