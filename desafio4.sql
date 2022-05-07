SELECT DISTINCT(users.first_name) AS usuario,
	   IF(YEAR(MAX(reproduction.reproduction_date)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.reproduction_history AS reproduction
INNER JOIN SpotifyClone.users AS users
ON reproduction.id_user = users.id_user
GROUP BY users.first_name;