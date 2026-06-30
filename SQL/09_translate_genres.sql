/*
========================================================
File: 09_translate_genres.sql

Purpose:
Standardizes non-English genre names into English genre
labels using a mapping table inside a CTE.

Output Table:
steam_master_final_clean
========================================================
*/

CREATE OR REPLACE TABLE `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final_clean` AS
WITH mapping AS (
    SELECT 'Acción' AS src, 'Action' AS dst UNION ALL
    SELECT 'Aksiyon', 'Action' UNION ALL
    SELECT 'Actie', 'Action' UNION ALL
    SELECT 'Akció', 'Action' UNION ALL
    SELECT 'Akcja', 'Action' UNION ALL
    SELECT 'Aksi', 'Action' UNION ALL
    SELECT 'Acțiune', 'Action' UNION ALL
    SELECT 'Azione', 'Action' UNION ALL
    SELECT 'Ação', 'Action' UNION ALL

    SELECT 'Abenteuer', 'Adventure' UNION ALL
    SELECT 'Aventura', 'Adventure' UNION ALL
    SELECT 'Aventure', 'Adventure' UNION ALL
    SELECT 'Aventură', 'Adventure' UNION ALL
    SELECT 'Avventura', 'Adventure' UNION ALL
    SELECT 'Dobrodružné', 'Adventure' UNION ALL
    SELECT 'Eventyr', 'Adventure' UNION ALL

    SELECT 'Basit Eğlence', 'Casual' UNION ALL
    SELECT 'Kasual', 'Casual' UNION ALL
    SELECT 'Fritid', 'Casual' UNION ALL
    SELECT 'Gelegenheitsspiele', 'Casual' UNION ALL
    SELECT 'Passatempo', 'Casual' UNION ALL

    SELECT 'Bağımsız Yapımcı', 'Indie' UNION ALL
    SELECT 'Devasa Çok Oyunculu', 'Massively Multiplayer' UNION ALL

    SELECT 'RYO', 'RPG' UNION ALL
    SELECT 'RPGlespill', 'RPG' UNION ALL
    SELECT 'Рольові ігри', 'RPG' UNION ALL

    SELECT 'Simulasi', 'Simulation' UNION ALL
    SELECT 'Simulatie', 'Simulation' UNION ALL
    SELECT 'Simulatoare', 'Simulation' UNION ALL
    SELECT 'Simulátory', 'Simulation' UNION ALL

    SELECT 'Strategi', 'Strategy' UNION ALL

    SELECT 'Deportes', 'Sports' UNION ALL
    SELECT 'Esportes', 'Sports' UNION ALL
    SELECT 'Sportst', 'Sports' UNION ALL
    SELECT 'Sportstovní', 'Sports' UNION ALL
    SELECT 'Sportstowe', 'Sports' UNION ALL

    SELECT 'Rennspiele', 'Racing' UNION ALL
    SELECT 'Corrida', 'Racing' UNION ALL
    SELECT 'Corse', 'Racing' UNION ALL

    SELECT 'Bildung', 'Education' UNION ALL
    SELECT 'Spieleentwicklung', 'Game Development' UNION ALL
    SELECT 'Acesso Antecipado', 'Early Access' UNION ALL
    SELECT 'Web-Publishing', 'Web Publishing'
)
SELECT
    t.* REPLACE (
        CASE
            WHEN t.genres IS NULL THEN NULL
            ELSE (
                SELECT STRING_AGG(
                    DISTINCT COALESCE(m.dst, TRIM(g)),
                    ', '
                    ORDER BY COALESCE(m.dst, TRIM(g))
                )
                FROM UNNEST(SPLIT(t.genres, ',')) AS g
                LEFT JOIN mapping AS m
                    ON TRIM(g) = m.src
            )
        END AS genres
    )
FROM `project-161521d0-df74-416a-827.steam_dataset_2025.steam_master_final` AS t;
