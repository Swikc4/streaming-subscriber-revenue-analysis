-- Quarter-over-quarter change in quarter-end streaming subscribers.
WITH subscribers AS (
    SELECT year, quarter, subscribers_millions AS current_subscribers,
           LAG(subscribers_millions) OVER (ORDER BY year, quarter) AS previous_subscribers
    FROM streaming_performance
)
SELECT year, quarter, current_subscribers, previous_subscribers,
       ROUND(current_subscribers - previous_subscribers, 2) AS subscriber_change_millions,
       ROUND((current_subscribers - previous_subscribers) * 100.0
             / NULLIF(previous_subscribers, 0), 2) AS subscriber_growth_pct
FROM subscribers
ORDER BY year, quarter;
