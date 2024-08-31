WITH TEMP AS(
SELECT
  employee_id, name, salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rank_id
FROM employee
)

SELECT salary FROM TEMP WHERE rank_id = 2;