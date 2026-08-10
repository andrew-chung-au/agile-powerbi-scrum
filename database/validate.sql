-- Executable integrity checks for the canonical MySQL database.
-- A Passed value of 1 means the check succeeded.

USE DataLensStreaming;

SELECT 'genres row count' AS CheckName, COUNT(*) = 18 AS Passed,
       COUNT(*) AS Actual, 18 AS Expected
FROM genres
UNION ALL
SELECT 'movies_clean row count', COUNT(*) = 3883, COUNT(*), 3883
FROM movies_clean
UNION ALL
SELECT 'users row count', COUNT(*) = 6040, COUNT(*), 6040
FROM users
UNION ALL
SELECT 'ratings_clean row count', COUNT(*) = 9998, COUNT(*), 9998
FROM ratings_clean
UNION ALL
SELECT 'movie_genres row count', COUNT(*) = 6404, COUNT(*), 6404
FROM movie_genres;

SELECT 'orphan rating users' AS CheckName, COUNT(*) = 0 AS Passed,
       COUNT(*) AS Actual, 0 AS Expected
FROM ratings_clean r
LEFT JOIN users u ON u.UserID = r.UserID
WHERE u.UserID IS NULL
UNION ALL
SELECT 'orphan rating movies', COUNT(*) = 0, COUNT(*), 0
FROM ratings_clean r
LEFT JOIN movies_clean m ON m.MovieID = r.MovieID
WHERE m.MovieID IS NULL
UNION ALL
SELECT 'orphan movie_genres movies', COUNT(*) = 0, COUNT(*), 0
FROM movie_genres mg
LEFT JOIN movies_clean m ON m.MovieID = mg.MovieID
WHERE m.MovieID IS NULL
UNION ALL
SELECT 'orphan movie_genres genres', COUNT(*) = 0, COUNT(*), 0
FROM movie_genres mg
LEFT JOIN genres g ON g.GenreID = mg.GenreID
WHERE g.GenreID IS NULL;

SELECT 'duplicate user/movie ratings' AS CheckName, COUNT(*) = 0 AS Passed,
       COUNT(*) AS Actual, 0 AS Expected
FROM (
  SELECT UserID, MovieID
  FROM ratings_clean
  GROUP BY UserID, MovieID
  HAVING COUNT(*) > 1
) duplicates;

SELECT 'ratings outside 1-5' AS CheckName, COUNT(*) = 0 AS Passed,
       COUNT(*) AS Actual, 0 AS Expected
FROM ratings_clean
WHERE Rating < 1.0 OR Rating > 5.0;
