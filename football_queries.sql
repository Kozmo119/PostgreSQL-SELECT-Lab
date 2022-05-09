-- -- 1.Find all the matches from 2017.
SELECT * FROM public.matches WHERE season = '2017';

-- -- 2. Find all the matches featuring Barcelona.
SELECT * FROM public.matches WHERE (hometeam = 'Barcelona' OR awayteam = 'Barcelona');


-- -- 3. What are the names of the Scottish divisions included?
SELECT name FROM public.divisions WHERE country = 'Scotland';

-- -- 4. Find the division code for the Bundesliga. Use that code to find out 
-- how many matches Freiburg have played in the Bundesliga since the data started being collected.
SELECT COUNT(*) FROM public.matches WHERE matches.division_code = 'D1' and (hometeam = 'Freiburg' or awayteam = 'Freiburg');


-- 5 Find the unique names of the teams which include the word "City" in their name (as entered in the database)
SELECT DISTINCT hometeam FROM public.matches WHERE (hometeam LIKE '%City%');

-- 6 How many different teams have played in matches recorded in a French division?
SELECT COUNT(DISTINCT hometeam) FROM public.matches WHERE (matches.division_code  = 'F1' OR matches.division_code  = 'F2');


-- 7 Have Huddersfield played Swansea in the period covered?
SELECT * FROM public.matches WHERE (hometeam = 'Huddersfield' AND awayteam = 'Swansea') OR (hometeam = 'Swansea' AND awayteam = 'Huddersfield');

--  8 How many draws were there in the Eredivisie between 2010 and 2015?
SELECT COUNT(*) FROM public.matches WHERE matches.division_code = 'N1' AND ftr = 'D' AND season BETWEEN 2010 AND 2015;


-- 9  Select the matches played in the Premier League in order of total goals scored from highest to lowest. Where there is a tie the match with more home goals should come first.
SELECT * FROM public.matches WHERE matches.division_code = 'E0' ORDER BY (fthg + ftag) DESC, fthg (DESC);

-- 10 In which division and which season were the most goals scored?
SELECT SUM(fthg+ftag) AS TotalGoalsPerSeason, division_code, season FROM public.matches GROUP BY division_code, season ORDER BY SUM(fthg+ftag) DESC;
