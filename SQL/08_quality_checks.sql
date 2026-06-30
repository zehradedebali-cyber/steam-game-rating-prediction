/*
========================================================
File: 08_quality_checks.sql

Purpose:
Runs basic quality checks on the final master table.

Checks:
- total row count
- games with reviews
- successful games
- free / paid game counts
- null counts by column
========================================================
*/

SELECT
    COUNT(*) AS total_rows,
    COUNTIF(has_reviews = TRUE) AS games_with_reviews,
    COUNTIF(is_successful = TRUE) AS successful_games,
    COUNTIF(price_type = 'Free') AS free_games,
    COUNTIF(price_type = 'Paid') AS paid_games
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final`;

SELECT
    COUNTIF(appid IS NULL) AS appid_null_count,
    COUNTIF(name IS NULL) AS name_null_count,
    COUNTIF(type IS NULL) AS type_null_count,
    COUNTIF(is_free IS NULL) AS is_free_null_count,
    COUNTIF(release_date IS NULL) AS release_date_null_count,
    COUNTIF(metacritic_score IS NULL) AS metacritic_score_null_count,
    COUNTIF(recommendations_total IS NULL) AS recommendations_total_null_count,
    COUNTIF(mat_initial_price IS NULL) AS mat_initial_price_null_count,
    COUNTIF(mat_final_price IS NULL) AS mat_final_price_null_count,
    COUNTIF(mat_discount_percent IS NULL) AS mat_discount_percent_null_count,
    COUNTIF(mat_supports_windows IS NULL) AS mat_supports_windows_null_count,
    COUNTIF(mat_supports_mac IS NULL) AS mat_supports_mac_null_count,
    COUNTIF(mat_supports_linux IS NULL) AS mat_supports_linux_null_count,
    COUNTIF(mat_achievement_count IS NULL) AS mat_achievement_count_null_count,
    COUNTIF(total_reviews IS NULL) AS total_reviews_null_count,
    COUNTIF(positive_reviews IS NULL) AS positive_reviews_null_count,
    COUNTIF(negative_reviews IS NULL) AS negative_reviews_null_count,
    COUNTIF(positive_rate IS NULL) AS positive_rate_null_count,
    COUNTIF(avg_playtime_forever IS NULL) AS avg_playtime_forever_null_count,
    COUNTIF(avg_playtime_at_review IS NULL) AS avg_playtime_at_review_null_count,
    COUNTIF(avg_weighted_vote_score IS NULL) AS avg_weighted_vote_score_null_count,
    COUNTIF(total_votes_up IS NULL) AS total_votes_up_null_count,
    COUNTIF(total_votes_funny IS NULL) AS total_votes_funny_null_count,
    COUNTIF(steam_purchase_reviews IS NULL) AS steam_purchase_reviews_null_count,
    COUNTIF(received_for_free_reviews IS NULL) AS received_for_free_reviews_null_count,
    COUNTIF(early_access_reviews IS NULL) AS early_access_reviews_null_count,
    COUNTIF(genres IS NULL) AS genres_null_count,
    COUNTIF(developers IS NULL) AS developers_null_count,
    COUNTIF(publishers IS NULL) AS publishers_null_count,
    COUNTIF(categories IS NULL) AS categories_null_count,
    COUNTIF(release_year IS NULL) AS release_year_null_count,
    COUNTIF(price_usd IS NULL) AS price_usd_null_count,
    COUNTIF(has_reviews IS NULL) AS has_reviews_null_count,
    COUNTIF(is_successful IS NULL) AS is_successful_null_count,
    COUNTIF(price_type IS NULL) AS price_type_null_count,
    COUNTIF(platform_count IS NULL) AS platform_count_null_count
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final`;
