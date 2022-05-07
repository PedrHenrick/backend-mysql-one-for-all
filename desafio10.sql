SELECT musics.music_name AS nome,
	     COUNT(reproduction.id_user) AS reproducoes
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.plans AS plans
INNER JOIN SpotifyClone.reproduction_history AS reproduction
INNER JOIN SpotifyClone.musics AS musics
ON reproduction.id_user = users.id_user 
AND reproduction.id_music = musics.id_music
AND users.id_plan = plans.id_plan
AND (plans.plan_name = 'Gratuito' OR plans.plan_name = 'Pessoal')
GROUP BY nome
ORDER BY nome;