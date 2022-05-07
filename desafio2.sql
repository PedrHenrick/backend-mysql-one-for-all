SELECT COUNT(musics.id_music) AS cancoes, 
	     COUNT(DISTINCT artists.id_artist) AS artistas,
       COUNT(DISTINCT albums.id_album) AS albuns
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums ON artists.id_artist = albums.id_artist
INNER JOIN SpotifyClone.musics AS musics ON musics.id_album = albums.id_album;