SELECT
a.artista_nome AS artista,
al.album_nome AS album
FROM 
artistas AS a
INNER JOIN albuns AS al 
ON a.artista_id = al.artista_id
WHERE artista_nome = 'Elis Regina'
GROUP BY artista, album ORDER BY album