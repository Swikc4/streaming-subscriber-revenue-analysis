-- Side-by-side revenue comparison for each quarter in 2024 and 2025.
SELECT 'Q' || quarter AS quarter_label,
       MAX(CASE WHEN year = 2024 THEN streaming_revenue_millions END) AS revenue_2024,
       MAX(CASE WHEN year = 2025 THEN streaming_revenue_millions END) AS revenue_2025
FROM streaming_performance
WHERE year IN (2024, 2025)
GROUP BY quarter
ORDER BY quarter;
