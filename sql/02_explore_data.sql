-- Explore the imported financial data chronologically.
SELECT
    year,
    quarter,
    subscribers_millions,
    streaming_revenue_millions
FROM streaming_performance
ORDER BY year, quarter;
