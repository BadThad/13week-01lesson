-- Query that selects all players as well as the games they have played and their scores.

SELECT
    players.name AS player_name,
    games.title AS game_title,
    scores.score
FROM scores
INNER JOIN players ON scores.player_id = players.id
INNER JOIN games ON scores.game_id = games.id
ORDER BY players.name, games.title;

-- Query that selects the top 3 players with the highest total scores across all games.

SELECT
    players.name AS player_name,
    SUM(scores.score) AS total_score
FROM scores
INNER JOIN players ON scores.player_id = players.id
GROUP BY players.name
ORDER BY total_score DESC
LIMIT 3;

-- Query that selects any player that has not played any games.

SELECT
    players.name AS player_name
FROM players
LEFT JOIN scores ON players.id = scores.player_id
WHERE scores.player_id IS NULL;

-- Query that selects the most played game across all players.

SELECT
    games.title AS game_title,
    COUNT(scores.id) AS times_played
FROM scores
INNER JOIN games ON scores.game_id = games.id
GROUP BY games.title
ORDER BY times_played DESC
LIMIT 1;

-- Query that selects the most popular game genre among the players.
-- (Not fair because half the games on my table are action/adventure!)

SELECT
    games.genre AS game_genre,
    COUNT(scores.id) AS times_played
FROM scores
INNER JOIN games ON scores.game_id = games.id
GROUP BY games.genre
ORDER BY times_played DESC
LIMIT 1;

-- Query that selects players who have joined in the last 5 years.

SELECT
    name,
    join_date
FROM players
WHERE join_date >= (CURRENT_DATE - INTERVAL '5 years');

-- Query that shows how many times each player has played each game they have played.

SELECT 
    players.name AS player_name,
    games.title AS game_title,
    COUNT(*) AS game_play_count
FROM scores
JOIN players ON scores.player_id = players.id
JOIN games ON scores.game_id = games.id
GROUP BY players.name, games.title
ORDER BY players.name, game_play_count DESC;

-- Query that selects which game each player has played the most.
-- Not able to get this one to work.

SELECT
    players.name AS player_name,
    games.title AS game_title,
    COUNT(*) AS game_play_count
FROM scores
JOIN players ON scores.player_id = players.id
JOIN games ON scores.game_id = games.id
GROUP BY scores.player_id, scores.game_id, players.name, games.title
HAVING COUNT(*) = (
    SELECT MAX(game_play_count)
    FROM (
        SELECT COUNT(*) AS game_play_count
        FROM scores
        WHERE player_id = scores.player_id
        GROUP BY game_id
    ) AS subquery
)

ORDER BY players.name;