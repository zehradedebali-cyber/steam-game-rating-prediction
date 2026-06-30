/*
========================================================
File: 01_review_summary_by_app.sql

Purpose:
Aggregates Steam review records at the application (appid)
level and calculates review statistics for each game.

Output Table:
review_summary_by_app
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.review_summary_by_app` AS
SELECT
    appid,
    COUNT(*) AS total_reviews,
    COUNTIF(voted_up = TRUE) AS positive_reviews,
    COUNTIF(voted_up = FALSE) AS negative_reviews,
    ROUND(COUNTIF(voted_up = TRUE) / COUNT(*), 4) AS positive_rate,
    ROUND(AVG(author_playtime_forever), 2) AS avg_playtime_forever,
    ROUND(AVG(author_playtime_at_review), 2) AS avg_playtime_at_review,
    ROUND(AVG(weighted_vote_score), 4) AS avg_weighted_vote_score,
    SUM(votes_up) AS total_votes_up,
    SUM(votes_funny) AS total_votes_funny,
    COUNTIF(steam_purchase = TRUE) AS steam_purchase_reviews,
    COUNTIF(received_for_free = TRUE) AS received_for_free_reviews,
    COUNTIF(written_during_early_access = TRUE) AS early_access_reviews
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.reviews`
GROUP BY appid;
