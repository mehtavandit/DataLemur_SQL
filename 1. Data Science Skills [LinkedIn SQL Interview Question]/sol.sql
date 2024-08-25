WITH TEMP AS(
  SELECT candidate_id,
         skill
  FROM
          candidates
  WHERE skill in ('Python', 'Tableau','PostgreSQL')
)

select candidate_id from temp group by candidate_id having count(*) = 3 order by candidate_id asc;