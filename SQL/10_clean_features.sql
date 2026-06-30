/*
========================================================
File: 10_clean_features.sql

Purpose:
Creates cleaned categorical and numeric fields for analysis
and machine learning.

Output Table:
steam_master_final_cleaned
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_cleaned` AS
SELECT
    *,
    COALESCE(type, 'Unknown') AS type_clean,
    COALESCE(genres, 'Unknown') AS genres_clean,
    COALESCE(developers, 'Unknown') AS developers_clean,
    COALESCE(publishers, 'Unknown') AS publishers_clean,
    COALESCE(categories, 'Unknown') AS categories_clean,

    COALESCE(total_reviews, 0) AS total_reviews_clean,
    COALESCE(positive_reviews, 0) AS positive_reviews_clean,
    COALESCE(negative_reviews, 0) AS negative_reviews_clean,
    COALESCE(recommendations_total, 0) AS recommendations_total_clean,
    COALESCE(mat_achievement_count, 0) AS achievement_count_clean

FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_clean`;
