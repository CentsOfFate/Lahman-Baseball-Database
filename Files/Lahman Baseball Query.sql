-- All queries are based off of the VIEW

-- Get all Columns
SELECT *
FROM vLahman

-- Total Hits by Team and by Year
SELECT
	Year,
	[Team Name],
	SUM(Hits) AS 'Total Hits'
FROM vLahman
GROUP BY [Team Name], [Year]
ORDER BY Year

-- MAX Hits
SELECT
	Year,
	MAX(Hits) AS 'Max Hits'
FROM vLahman
GROUP BY [Year]
ORDER BY Year

-- Average Salary 
SELECT
	Year,
	[Team Name],
	ROUND(AVG(Salary), 2) AS 'Average Salary'
FROM vLahman
GROUP BY [Team Name], [Year]
ORDER BY Year

-- Total Number of Hits by Team and by Year Where Doubles are less than the Highest Average Doubles of that Year
SELECT
	Year,
	[Team Name],
	SUM(Hits) 'Total Hits'
FROM vLahman
WHERE Doubles < (
	SELECT TOP (1)
		AVG(Doubles) AS 'Average Doubles'
	FROM vLahman
	GROUP BY Year
	ORDER BY [Average Doubles] DESC
)
GROUP BY [Team Name], [Year]
