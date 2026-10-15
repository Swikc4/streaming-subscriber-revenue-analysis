-- Difference in reported quarterly streaming revenue (USD millions).
WITH revenue AS (
    SELECT year, quarter, streaming_revenue_millions AS current_revenue,
           LAG(streaming_revenue_millions) OVER (ORDER BY year, quarter) AS previous_revenue
    FROM streaming_performance
)
SELECT year, quarter, current_revenue, previous_revenue,
       current_revenue - previous_revenue AS revenue_change_millions
FROM revenue
ORDER BY year, quarter;
