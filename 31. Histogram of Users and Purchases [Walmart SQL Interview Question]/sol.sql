WITH TEMP AS(
  SELECT
    product_id, user_id, 
    transaction_date, 
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) as ranked
  FROM user_transactions
)


SELECT
  transaction_date, user_id,count(product_id)
FROM temp
WHERE ranked = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date;