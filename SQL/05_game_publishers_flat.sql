/*
========================================================
File: 05_game_publishers_flat.sql

Purpose:
Creates a flattened publisher table by aggregating multiple
publishers into a single comma-separated field per appid.

Output Tables:
- game_publishers_flat
- steam_master_v4
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.game_publishers_flat` AS
SELECT
    ap.appid,
    STRING_AGG(DISTINCT p.name, ', ' ORDER BY p.name) AS publishers
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.application_publishers` AS ap
JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.publishers` AS p
    ON ap.publisher_id = p.id
GROUP BY ap.appid;

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v4` AS
SELECT
    s.*,
    p.publishers
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v3` AS s
LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.game_publishers_flat` AS p
    ON s.appid = p.appid;
