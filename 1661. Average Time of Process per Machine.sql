# Write your MySQL query statement below
SELECT T1.machine_id, ROUND(SUM(T2.timestamp-T1.timestamp)/COUNT(T1.timestamp),3) As processing_time
FROM
(SELECT * FROM Activity
WHERE activity_type='start') AS T1
INNER JOIN
(SELECT * FROM Activity 
WHERE activity_type='end') AS T2
ON T1.machine_id=T2.machine_id AND T1.process_id=T2.process_id
GROUP BY machine_id
