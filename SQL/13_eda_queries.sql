/*
========================================================
File: 13_eda_queries.sql

Purpose:
Includes analysis queries used for reporting and Power BI.

Main Analyses:
- Genre-level highly rated percentage
- Price distribution
- Release year distribution
- Platform support distribution
========================================================
*/

-- Highly rated percentage by genre
SELECT
    TRIM(genre) AS genre,
    COUNT(*) AS total_games,
    ROUND(AVG(is_highly_rated) * 100, 2) AS highly_rated_pct
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling`,
UNNEST(SPLIT(genres_clean, ',')) AS genre
GROUP BY genre
HAVING COUNT(*) > 100
ORDER BY highly_rated_pct DESC;

-- Price distribution
SELECT
    COUNT(*) AS total_games,
    ROUND(AVG(price_usd), 2) AS avg_price,
    APPROX_QUANTILES(price_usd, 100)[OFFSET(50)] AS median_price,
    MIN(price_usd) AS min_price,
    MAX(price_usd) AS max_price
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling`
WHERE price_usd IS NOT NULL;

-- Release year distribution
SELECT
    release_year,
    COUNT(*) AS total_games,
    ROUND(AVG(is_highly_rated) * 100, 2) AS highly_rated_pct
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling`
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY release_year;

-- Platform count distribution
SELECT
    platform_count,
    COUNT(*) AS total_games,
    ROUND(AVG(is_highly_rated) * 100, 2) AS highly_rated_pct
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling`
GROUP BY platform_count
ORDER BY platform_count;
