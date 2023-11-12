# Write your MySQL query statement below
SELECT R.contest_id,
ROUND((COUNT(R.contest_id)/(SELECT COUNT(user_id) FROM Users))*100, 2)
AS percentage
FROM Register R
GROUP BY R.contest_id
ORDER BY ROUND((COUNT(R.contest_id)/(SELECT COUNT(user_id) FROM Users))*100, 2) DESC, R.contest_id ASC
