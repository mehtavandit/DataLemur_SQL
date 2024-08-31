WITH TEMP AS(
SELECT 
  department_id, name, salary, 
  DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as rank_id
FROM employee
)

SELECT 
  d.department_name,t.name, t.salary
FROM temp as t
INNER JOIN department as d ON t.department_id = d.department_id
where t.rank_id <= 3
ORDER BY d.department_name ASC, t.salary DESC, t.name ASC;