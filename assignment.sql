CREATE DATABASE soccer_DB;
USE soccer_DB;


SELECT * from soccer_team;
-- first answer
SELECT COUNT(DISTINCT team_id) AS num_participating_countries
FROM player_mast
WHERE play_stage = '2016-EURO Cup';


-- second answer
SELECT COUNT(*) AS num_matches_with_result
FROM match_mast
WHERE result IS NOT NULL;

-- third answer
SELECT MIN(play_schedule) AS euro_cup_start_date
FROM match_mast
WHERE play_stage = 'EURO cup 2016';
-- third answer

-- forth asnswer
SELECT sv.venue_name, sc.city
FROM soccer_venue sv
JOIN soccer_city sc ON sv.city_id = sc.city_id
JOIN match_mast mm ON sv.venue_id = mm.venue_id
WHERE mm.play_stage = 'EURO cup 2016' AND mm.play_schedule = (SELECT MAX(play_schedule) FROM match_mast WHERE play_stage = 'EURO cup 2016');


-- fifth answer
SELECT md.match_no, sc.country_name, md.goal_score
FROM match_details md
JOIN soccer_country sc ON md.team_id = sc.country_id
ORDER BY md.match_no;
 -- six answer


SELECT 
    player_name,
    country_name,
    COUNT(*) AS num_goals
FROM 
    goal_details gd
JOIN 
    player_mast pm ON gd.player_id = pm.player_id
JOIN 
    soccer_country sc ON pm.team_id = sc.country_id
WHERE 
    gd.goal_type = 'normal play'
GROUP BY 
    player_name, country_name
ORDER BY 
    num_goals DESC;
 -- nine answer
 SELECT match_no, play_stage, goal_score, audience
FROM match_mast
ORDER BY audience DESC
LIMIT 1;
 -- ten answer
 SELECT
    gd.match_no,
    sc.country_name,
    pm.player_name,
    COUNT(gd.goal_id) AS num_goals
FROM
    goal_details gd
JOIN
    player_mast pm ON gd.player_id = pm.player_id
JOIN
    soccer_country sc ON pm.team_id = sc.country_id
GROUP BY
    gd.match_no, sc.country_name, pm.player_name
ORDER BY
    gd.match_no;
--eight answer
SELECT
    md.match_no,
    home_team.country_name AS home_team_name,
    away_team.country_name AS away_team_name
FROM
    match_details md
JOIN
    soccer_country home_team ON md.team_id = home_team.country_id
JOIN
    soccer_country away_team ON md.team_id_1 = away_team.country_id
WHERE
    md.play_stage = '2016 Euro Cup'
ORDER BY
    md.match_no
LIMIT 1;
