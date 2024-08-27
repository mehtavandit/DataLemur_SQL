WITH TEMP AS(
  SELECT card_name, MIN(issued_amount) as min_amount, MAX(issued_amount) as max_amount
  FROM monthly_cards_issued group by card_name
)

SELECT card_name, max_amount - min_amount as difference from temp
order by difference desc;