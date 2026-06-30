/*
========================================================
File: 07_create_steam_master_final.sql

Purpose:
Creates the final master table with additional engineered
features for analysis and modeling.

Features Created:
- release_year
- price_usd
- has_reviews
- is_successful
- price_type
- platform_count

Output Table:
steam_master_final
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final` AS
SELECT
    *,
    EXTRACT(YEAR FROM release_date) AS release_year,
    mat_final_price / 100 AS price_usd,

    CASE
        WHEN total_reviews IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS has_reviews,

    CASE
        WHEN positive_rate >= 0.80 AND total_reviews >= 50 THEN TRUE
        ELSE FALSE
    END AS is_successful,

    CASE
        WHEN is_free = TRUE THEN 'Free'
        WHEN mat_final_price = 0 THEN 'Free'
        WHEN mat_final_price IS NULL THEN 'Unknown'
        ELSE 'Paid'
    END AS price_type,

    CAST(mat_supports_windows AS INT64)
    + CAST(mat_supports_mac AS INT64)
    + CAST(mat_supports_linux AS INT64) AS platform_count

FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_v5`;
