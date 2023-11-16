# Write your MySQL query statement below

SELECT E1.employee_id, E1.name, E2.reports_count, E2.average_age
FROM Employees E1
INNER JOIN
(
  SELECT reports_to,COUNT(reports_to) AS reports_count, ROUND(AVG(age)) AS average_age
FROM Employees
WHERE reports_to IS NOT NULL
GROUP BY reports_to
) AS E2
ON E1.employee_id=E2.reports_to
ORDER BY E1.employee_id
