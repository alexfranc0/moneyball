-- all star lineups from 2015
-- need: name (f/l), year (2015), roster (AL/NL)


-- people
	-- playerID
	--nameFirst
	--nameLast

--AllStar
	--playerID
	--lgID
	--yearID

--TEams
	-- yearID
	--lgID


--SELECT CONCAT(p.nameFirst, ' ', p.nameLast) AS NAME, s.lgID AS LEAGUE, s.yearID AS YEAR
--FROM AllstarFull s
--JOIN People p ON s.playerID = p.playerID
--WHERE s.yearID = 2015
--ORDER BY s.lgID ASC


-- Load moneyball A's

-- people
	-- playerID
	--nameFirst
	--nameLast

--teams
	-- teamID
	-- yearID

--appearance
	--teamID
	--yearID
	--playerID


SELECT CONCAT(p.nameFirst, ' ', p.nameLast) AS NAME, 
		t.teamID AS TEAM, 
		t.yearID AS YEAR,
		FORMAT(1.0 * b.h/NULLIF(b.ab, 0), '0.###') AS AVG,
		STRING_AGG(f.POS, ', ') AS positions
FROM Appearances a
JOIN Teams t ON t.teamID = a.teamID 
			 AND t.yearID = a.yearID
JOIN People p ON a.playerID = p.playerID
JOIN Fielding f ON f.playerID = a.playerID
				AND f.yearID = a.yearID
				AND f.teamID = a.teamID
JOIN Batting b ON b.playerID = a.playerID
				AND b.yearID = a.yearID
				AND b.teamID = a.teamID
WHERE t.teamID = 'OAK' 
	AND t.yearID = 2001 
	AND f.POS != 'P'
GROUP BY p.nameFirst, p.nameLast, t.teamID, t.yearID, b.H, b.AB
ORDER BY NAME ASC;



