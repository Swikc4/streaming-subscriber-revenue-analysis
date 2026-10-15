-- Quarter-over-quarter streaming revenue change, in millions and percent.
WITH revenue AS (
    SELECT year, quarter, streaming_revenue_millions AS current_revenue,
           LAG(streaming_revenue_millions) OVER (ORDER BY year, quarter) AS previous_revenue
    FROM streaming_performance
)
SELECT year, quarter, current_revenue, previous_revenue,
       current_revenue - previous_revenue AS revenue_change_millions,
       ROUND((current_revenue - previous_revenue) * 100.0 / NULLIF(previous_revenue, 0), 2)
           AS revenue_growth_pct
FROM revenue
ORDER BY year, quarter;
