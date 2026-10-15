-- Query 3: Look back to the preceding available quarter.
SELECT
    year,
    quarter,
    streaming_revenue_millions AS current_revenue,
    LAG(streaming_revenue_millions) OVER (
        ORDER BY year, quarter
    ) AS previous_revenue
FROM streaming_performance
ORDER BY year, quarter;
