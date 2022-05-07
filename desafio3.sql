SELECT users.first_name AS usuario,
	COUNT(reproduction.id_music) AS qtde_musicas_ouvidas,
       ROUND((SUM(musics.seconds_duration) / 60), 2) AS total_minutos
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.reproduction_history AS reproduction
ON users.id_user = reproduction.id_user
INNER JOIN SpotifyClone.musics AS musics
ON users.id_user = reproduction.id_user AND reproduction.id_music = musics.id_music 
GROUP BY users.first_name;