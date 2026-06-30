/*
========================================================
File: 06_game_categories_flat.sql

Purpose:
Creates a flattened category table by aggregating multiple
categories into a single comma-separated field per appid.

Output Tables:
- game_categories_flat
- steam_master_v5
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.game_categories_flat` AS
SELECT
    ac.appid,
    STRING_AGG(DISTINCT c.name, ', ' ORDER BY c.name) AS categories
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.application_categories` AS ac
JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.categories` AS c
    ON ac.category_id = c.id
GROUP BY ac.appid;

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v5` AS
SELECT
    s.*,
    c.categories
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v4` AS s
LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.game_categories_flat` AS c
    ON s.appid = c.appid;
