/*
========================================================
File: 12_create_target.sql

Purpose:
Creates the final machine learning target column.

Target:
is_highly_rated = 1 if positive_rate >= 0.90
is_highly_rated = 0 otherwise

Important:
Only games with reviews are kept in the final modeling table.

Output Table:
steam_master_modeling
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling` AS
SELECT
    *,
    CASE
        WHEN positive_rate >= 0.90 THEN 1
        ELSE 0
    END AS is_highly_rated
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_final`
WHERE has_reviews = TRUE;

-- Target distribution check
SELECT
    is_highly_rated,
    COUNT(*) AS game_count
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_modeling`
GROUP BY is_highly_rated
ORDER BY is_highly_rated;
