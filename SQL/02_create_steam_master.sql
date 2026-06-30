/*
========================================================
File: 02_create_steam_master.sql

Purpose:
Creates the first master table by joining application-level
game information with aggregated review statistics.

Input Tables:
- applications
- review_summary_by_app

Output Table:
steam_master
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master` AS
SELECT
    a.appid,
    a.name,
    a.type,
    a.is_free,
    a.release_date,
    a.metacritic_score,
    a.recommendations_total,
    a.mat_initial_price,
    a.mat_final_price,
    a.mat_discount_percent,
    a.mat_supports_windows,
    a.mat_supports_mac,
    a.mat_supports_linux,
    a.mat_achievement_count,
    r.total_reviews,
    r.positive_reviews,
    r.negative_reviews,
    r.positive_rate,
    r.avg_playtime_forever,
    r.avg_playtime_at_review,
    r.avg_weighted_vote_score,
    r.total_votes_up,
    r.total_votes_funny,
    r.steam_purchase_reviews,
    r.received_for_free_reviews,
    r.early_access_reviews
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.applications` AS a
LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.review_summary_by_app` AS r
    ON a.appid = r.appid;
