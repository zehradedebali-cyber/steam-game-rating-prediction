/*
========================================================
File: 11_missing_value_imputation.sql

Purpose:
Applies median-based imputation to selected review metrics
and creates a missingness flag for metacritic_score.

Median Values Used:
- positive_rate: 0.95
- avg_playtime_forever: 91.5
- avg_playtime_at_review: 143.0
- avg_weighted_vote_score: 0.5072

Output Table:
steam_master_final_final
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_final` AS
SELECT
    t.* REPLACE (
        COALESCE(positive_rate, 0.95) AS positive_rate,
        COALESCE(avg_playtime_forever, 91.5) AS avg_playtime_forever,
        COALESCE(avg_playtime_at_review, 143.0) AS avg_playtime_at_review,
        COALESCE(avg_weighted_vote_score, 0.5072) AS avg_weighted_vote_score
    ),

    CASE
        WHEN metacritic_score IS NULL THEN 0
        ELSE 1
    END AS has_metacritic

FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_cleaned` AS t;
