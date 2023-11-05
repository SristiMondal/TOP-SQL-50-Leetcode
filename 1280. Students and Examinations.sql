# Write your MySQL query statement below
SELECT T1.student_id, T1.student_name, T1.subject_name, COALESCE(E1.attended_exams,0) AS attended_exams
FROM (SELECT S.student_id, S.student_name, Su.subject_name
FROM Students S
INNER JOIN
Subjects Su) AS T1
LEFT JOIN
(SELECT student_id,subject_name, COUNT(subject_name) AS attended_exams  
FROM Examinations
GROUP BY student_id, subject_name
ORDER BY student_id) AS E1
ON T1.student_id=E1.student_id AND T1.subject_name=E1.subject_name
ORDER BY T1.student_id, T1.subject_name
