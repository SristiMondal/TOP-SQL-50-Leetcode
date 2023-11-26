# Write your MySQL query statement below
SELECT E1.employee_id, E1.department_id 
FROM Employee E1
WHERE E1.employee_id NOT IN 
(SELECT employee_id
FROM Employee
WHERE primary_flag='Y') OR E1.primary_flag='Y'
GROUP BY E1.employee_id
HAVING COUNT(E1.department_id)=1
