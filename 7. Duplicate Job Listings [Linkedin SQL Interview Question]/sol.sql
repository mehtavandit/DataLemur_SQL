WITH temp as (
  SELECT
    company_id,
    title,
    description,
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
from temp where job_count > 1;