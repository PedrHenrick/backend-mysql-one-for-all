SELECT music_name AS nome_musica,
  CASE
    WHEN music_name LIKE '%Streets%' THEN REPLACE(music_name, 'Streets', 'Code Review')
    WHEN music_name LIKE '%Her Own%' THEN REPLACE(music_name, 'Her Own', 'Trybe')
    WHEN music_name LIKE '%Inner Fire%' THEN REPLACE(music_name, 'Inner Fire', 'Project')
    WHEN music_name LIKE '%Silly%' THEN REPLACE(music_name, 'Silly', 'Nice')
    WHEN music_name LIKE '%Circus%' THEN REPLACE(music_name, 'Circus', 'Pull Request')
    ELSE NULL
  END AS novo_nome
FROM SpotifyClone.musics
HAVING novo_nome IS NOT NULL
ORDER BY music_name;

-- Referência: https://www.w3schools.com/sql/sql_null_values.asp
