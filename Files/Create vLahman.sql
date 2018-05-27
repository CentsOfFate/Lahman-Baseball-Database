-- Define View
CREATE VIEW [vLahman] AS
SELECT 
	People.nameLast AS 'Last Name'
	,People.nameGiven AS 'Full Name'
	,Batting.[yearID] AS 'Year'
	,Teams.name AS 'Team Name'
	,Salaries.salary AS 'Salary'
	,Batting.[G] AS 'Games'
	,Batting.[AB] AS 'At Bats'
	,Batting.[R] AS 'Runs'
	,Batting.[H] AS 'Hits'
	,Batting.[2B] AS 'Doubles'
	,Batting.[3B] AS 'Triples'
	,Batting.[HR] AS 'Home Runs'
	,Batting.[RBI] AS 'Runs Batted In'
	,Batting.[SB] AS 'Stolen Bases'
	,Batting.[CS] AS 'Caught Stealing'
	,Batting.[BB] AS 'Base on Balls'
	,Batting.[SO] AS 'Strikeouts'
	,Batting.[IBB] AS 'Intentional Walks'
	,Batting.[HBP] AS 'Hit by Pitch'
	,Batting.[SH] AS 'Sacrifice Hits'
	,Batting.[SF] AS 'Sacrifice Flies'
	,Batting.[GIDP] AS 'Grounded into Double Plays'
FROM [Lahman Baseball].[dbo].[Batting] AS Batting
JOIN [Lahman Baseball].[dbo].[People] AS People
ON Batting.playerID = People.playerID
JOIN [Lahman Baseball].[dbo].[Teams] AS Teams
ON Batting.teamID = Teams.teamID AND Batting.yearID = Teams.yearID
JOIN [Lahman Baseball].[dbo].Salaries AS Salaries
ON Batting.playerID = Salaries.playerID AND Batting.yearID = Salaries.yearID AND Batting.teamID = Salaries.teamID
WHERE Batting.yearID BETWEEN 2007 AND 2017
