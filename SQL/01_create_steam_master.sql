/*
========================================================
File: 01_create_steam_master.sql

Purpose:
Creates the initial master table by combining the
applications table with aggregated review statistics.

This table serves as the foundation for subsequent
feature engineering and machine learning preparation.

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

FROM `project-161521d0-df74-416a-827.steam_dataset_2025.applications` a

LEFT JOIN `project-161521d0-df74-416a-827.steam_dataset_2025.review_summary_by_app` r
ON a.appid = r.appid;