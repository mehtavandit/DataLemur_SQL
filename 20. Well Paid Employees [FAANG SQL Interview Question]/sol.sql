SELECT 
  e1.employee_id, e1.name 
FROM employee e1 INNER JOIN employee e2
ON e1.manager_id = e2.employee_id
WHERE e1.salary > e2.salary;