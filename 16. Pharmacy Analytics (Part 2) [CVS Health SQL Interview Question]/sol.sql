
SELECT manufacturer, count(drug), sum((cogs - total_sales)) as total_loss 
FROM pharmacy_sales where (cogs - total_sales) > 0 group by manufacturer
order by sum((cogs - total_sales)) desc;