WITH TEMP AS(
  SELECT 
  user_id, spend, transaction_date, RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) as rank_id
  FROM transactions
)

SELECT 
  user_id, spend, transaction_date 
FROM TEMP
WHERE rank_id = 3;

