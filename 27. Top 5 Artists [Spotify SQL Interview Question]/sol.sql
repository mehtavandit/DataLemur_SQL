WITH temp as(
SELECT
  artists.artist_name,
  DENSE_RANK() OVER(ORDER BY COUNT(songs.song_id) DESC) as artist_rank
FROM artists
INNER JOIN songs
ON artists.artist_id = songs.artist_id
INNER JOIN global_song_rank as ranking
ON songs.song_id = ranking.song_id
WHERE ranking.rank <= 10
GROUP BY artists.artist_name
)

SELECT artist_name, artist_rank
FROM temp where artist_rank <= 5;