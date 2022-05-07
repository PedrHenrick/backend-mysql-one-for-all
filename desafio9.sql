SELECT COUNT(reproduction.id_user) AS quantidade_musicas_no_historico
FROM SpotifyClone.reproduction_history AS reproduction
INNER JOIN SpotifyClone.users AS users
ON users.id_user = reproduction.id_user AND users.first_name = 'Bill';