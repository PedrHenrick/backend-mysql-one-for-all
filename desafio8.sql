SELECT CONCAT(artists.first_name, ' ', artists.last_name) as artista,
	     albums.album_name as album
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums
ON artists.id_artist = albums.id_artist AND artists.first_name = 'Walter'

ORDER BY albums.album_name;