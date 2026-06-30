/*
========================================================
File: 02_game_genres_flat.sql

Purpose:
Creates a flattened genre table by aggregating all
genres associated with each Steam game into a single
comma-separated field.

This transformation converts the many-to-many
relationship between applications and genres into
a one-row-per-game structure suitable for joining
with the master dataset.

Input Tables:
- application_genres
- genres

Output Table:
game_genres_flat

========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.game_genres_flat` AS

SELECT
    ag.appid,
    STRING_AGG(DISTINCT g.name, ', ' ORDER BY g.name) AS genres

FROM `project-161521d0-df74-416a-827.steam_dataset_2025.application_genres` ag

JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.genres` g
    ON ag.genre_id = g.id

GROUP BY ag.appid;