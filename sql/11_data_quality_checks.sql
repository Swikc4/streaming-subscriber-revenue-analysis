-- PostgreSQL 18: verify coverage and basic data quality.
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT (year, quarter)) AS distinct_quarters,
    COUNT(*) FILTER (WHERE subscribers_millions IS NULL OR subscribers_millions <= 0)
        AS invalid_subscriber_rows,
    COUNT(*) FILTER (WHERE streaming_revenue_millions IS NULL OR streaming_revenue_millions < 0)
        AS invalid_revenue_rows
FROM streaming_performance;

-- Check for missing quarterly periods in the supplied 2024-2025 range.
WITH expected AS (
    SELECT years.year, quarters.quarter
    FROM generate_series(2024, 2025) AS years(year)
    CROSS JOIN generate_series(1, 4) AS quarters(quarter)
)
SELECT e.year, e.quarter
FROM expected AS e
LEFT JOIN streaming_performance AS s
  ON e.year = s.year AND e.quarter = s.quarter
WHERE s.id IS NULL
ORDER BY e.year, e.quarter;
