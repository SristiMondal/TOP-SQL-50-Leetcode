# Write your MySQL query statement below
SELECT T1.day, COUNT(T1.day) AS active_users
FROM 
(SELECT  DISTINCT activity_date AS day, user_id
FROM Activity
WHERE activity_date 
BETWEEN '2019-06-28' AND '2019-07-27') 
AS T1
GROUP BY day
ORDER BY day



