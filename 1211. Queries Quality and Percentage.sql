# Write your MySQL query statement below
SELECT T2.query_name, T2.quality, COALESCE(T3.poor_query_percentage,0) AS poor_query_percentage
FROM 
(SELECT Q1.query_name, ROUND(SUM(Q1.rating/Q1.position)/T4.total,2) AS quality
FROM Queries Q1
INNER JOIN
(
  SELECT query_name, COUNT(query_name) As total FROM Queries
GROUP BY query_name
) AS T4
ON Q1.query_name=T4.query_name
GROUP BY Q1.query_name
) As T2
LEFT JOIN 
(
  SELECT Q.query_name, 
   ROUND((COUNT(Q.rating)/T1.total)*100,2)
  AS poor_query_percentage FROM Queries Q
INNER JOIN 
(
  SELECT query_name, COUNT(query_name) As total FROM Queries
GROUP BY query_name
) AS T1
ON Q.query_name=T1.query_name
WHERE Q.rating<3 
GROUP BY query_name
) As T3
ON T2.query_name=T3.query_name
