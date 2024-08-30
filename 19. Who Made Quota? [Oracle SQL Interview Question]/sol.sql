WITH TEMP AS(
  SELECT employee_id, sum(deal_size) as deals
  FROM deals GROUP BY employee_id
)

SELECT 
  t.employee_id,
  CASE
    WHEN t.deals >= s.quota THEN 'yes' ELSE 'no' END AS made_quota
FROM temp t INNER JOIN sales_quotas s
ON t.employee_id = s.employee_id
ORDER BY t.employee_id;