/*
========================================================
File: 04_game_developers_flat.sql

Purpose:
Creates a flattened developer table by aggregating multiple
developers into a single comma-separated field per appid.

Output Tables:
- game_developers_flat
- steam_master_v3
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.game_developers_flat` AS
SELECT
    ad.appid,
    STRING_AGG(DISTINCT d.name, ', ' ORDER BY d.name) AS developers
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.application_developers` AS ad
JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.developers` AS d
    ON ad.developer_id = d.id
GROUP BY ad.appid;

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v3` AS
SELECT
    s.*,
    d.developers
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v2` AS s
LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.game_developers_flat` AS d
    ON s.appid = d.appid;
