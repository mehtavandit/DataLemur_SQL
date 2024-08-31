WITH TEMP AS(
SELECT
  category, 
  product, 
  SUM(spend) as money,
  DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) as rank_id
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
)

SELECT 
  category, product, money  
FROM Temp
WHERE rank_id in (1,2)
ORDER BY category;