-- Compare QoQ revenue and quarter-end subscriber growth.
WITH growth AS (
    SELECT year, quarter, streaming_revenue_millions, subscribers_millions,
           LAG(streaming_revenue_millions) OVER (ORDER BY year, quarter) AS previous_revenue,
           LAG(subscribers_millions) OVER (ORDER BY year, quarter) AS previous_subscribers
    FROM streaming_performance
)
SELECT year || '-Q' || quarter AS period,
       ROUND((streaming_revenue_millions - previous_revenue) * 100.0
             / NULLIF(previous_revenue, 0), 2) AS revenue_growth_pct,
       ROUND((subscribers_millions - previous_subscribers) * 100.0
             / NULLIF(previous_subscribers, 0), 2) AS subscriber_growth_pct
FROM growth
ORDER BY year, quarter;
