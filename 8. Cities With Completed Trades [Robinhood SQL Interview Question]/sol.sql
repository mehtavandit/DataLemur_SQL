SELECT users.city, 
  COUNT(trades.order_id) AS total_orders
FROM trades 
JOIN users
  ON trades.user_id = users.user_id 
GROUP BY users.city limit 3;