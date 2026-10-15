-- Query 8: Quarterly streaming segment revenue divided by quarter-end subscribers.
-- Illustrative quarterly ratio (USD), not WBD's official monthly ARPU.
SELECT
    year || '-Q' || quarter AS period,
    ROUND(
        streaming_revenue_millions / NULLIF(subscribers_millions, 0),
        2
    ) AS revenue_per_subscriber
FROM streaming_performance
ORDER BY year, quarter;
