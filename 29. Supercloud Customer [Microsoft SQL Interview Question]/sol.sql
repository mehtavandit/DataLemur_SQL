WITH TEMP AS(
SELECT
  c.customer_id, COUNT(DISTINCT p.product_category) as p_count
FROM customer_contracts as c INNER JOIN products as p 
ON c.product_id = p.product_id
GROUP BY c.customer_id
)

SELECT customer_id FROM TEMP
WHERE p_count = (SELECT COUNT(DISTINCT product_category) FROM products);