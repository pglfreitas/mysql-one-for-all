SELECT
a.artista_nome AS artista,
al.album_nome AS album,
COUNT(s.usuario_id) AS pessoas_seguidoras
FROM 
artistas AS a
INNER JOIN albuns AS al 
ON a.artista_id = al.artista_id
INNER JOIN seguidores AS s 
ON a.artista_id = s.artista_id
GROUP BY artista, album ORDER BY pessoas_seguidoras DESC, artista, album 