SELECT musics.music_name AS cancao,
	COUNT(reproduction.id_music) AS reproducoes
FROM SpotifyClone.musics AS musics
INNER JOIN SpotifyClone.reproduction_history AS reproduction
ON reproduction.id_music = musics.id_music
GROUP BY musics.music_name
ORDER BY reproducoes DESC, musics.music_name
LIMIT 2;
