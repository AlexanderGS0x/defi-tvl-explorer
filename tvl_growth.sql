-- Calculate average TVL for Q1 2024 and Q1 2025, then compute growth percentage
WITH q1_2024 AS (
  SELECT Protocol, AVG(TVL_USD) AS avg_tvl_2024
  FROM `defi-tvl-project.defi_tvl.tvl_data`
  WHERE Date BETWEEN '2024-01-01' AND '2024-03-31'
  GROUP BY Protocol
),
q1_2025 AS (
  SELECT Protocol, AVG(TVL_USD) AS avg_tvl_2025
  FROM `defi-tvl-project.defi_tvl.tvl_data`
  WHERE Date BETWEEN '2025-01-01' AND '2025-03-31'
  GROUP BY Protocol
)
SELECT 
  q1_2024.Protocol,
  ROUND(q1_2024.avg_tvl_2024, 2) AS avg_tvl_2024,
  ROUND(q1_2025.avg_tvl_2025, 2) AS avg_tvl_2025,
  ROUND(((q1_2025.avg_tvl_2025 - q1_2024.avg_tvl_2024) / q1_2024.avg_tvl_2024 * 100), 2) AS growth_percentage
FROM q1_2024
LEFT JOIN q1_2025 ON q1_2024.Protocol = q1_2025.Protocol
ORDER BY growth_percentage DESC;