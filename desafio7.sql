SELECT CONCAT(artists.first_name, IFNULL(CONCAT(' ', artists.last_name), '')) AS artista,
	     albums.album_name AS album,
       COUNT(followers.id_user) AS seguidores
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums
ON artists.id_artist = albums.id_artist
INNER JOIN SpotifyClone.followers AS followers
ON artists.id_artist = followers.id_artist
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC