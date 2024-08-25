SELECT
  distinct(p.page_id)
FROM pages as p
LEFT JOIN page_likes as L on p.page_id = l.page_id
where l.liked_date is Null;