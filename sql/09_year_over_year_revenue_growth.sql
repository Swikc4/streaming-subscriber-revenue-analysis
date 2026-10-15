-- Compare each quarter with the same quarter in the previous year.
-- Join by year and quarter; unlike LAG(..., 4), this handles missing quarters.
SELECT current.year, current.quarter,
       current.streaming_revenue_millions AS current_revenue,
       previous.streaming_revenue_millions AS previous_year_revenue,
       ROUND((current.streaming_revenue_millions - previous.streaming_revenue_millions) * 100.0
             / NULLIF(previous.streaming_revenue_millions, 0), 2) AS yoy_growth_pct
FROM streaming_performance AS current
LEFT JOIN streaming_performance AS previous
  ON previous.year = current.year - 1 AND previous.quarter = current.quarter
ORDER BY current.year, current.quarter;
