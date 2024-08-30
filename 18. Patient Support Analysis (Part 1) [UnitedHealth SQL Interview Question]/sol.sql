WITH TEMP AS(
  SELECT policy_holder_id, count(case_id) as total
  FROM callers group by policy_holder_id
  HAVING count(case_id) > 2
)

SELECT count(policy_holder_id) as policy_holder_count from temp; 