/*
========================================================
File: 03_game_genres_flat.sql

Purpose:
Creates a flattened genre table by aggregating multiple
genres into a single comma-separated field per appid.

Output Tables:
- game_genres_flat
- steam_master_v2
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.game_genres_flat` AS
SELECT
    ag.appid,
    STRING_AGG(DISTINCT g.name, ', ' ORDER BY g.name) AS genres
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.application_genres` AS ag
JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.genres` AS g
    ON ag.genre_id = g.id
GROUP BY ag.appid;

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v2` AS
SELECT
    s.*,
    g.genres
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master` AS s
LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.game_genres_flat` AS g
    ON s.appid = g.appid;
