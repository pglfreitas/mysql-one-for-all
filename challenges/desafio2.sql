SELECT
(SELECT COUNT(cancao_id) FROM cancoes) as cancoes,
(SELECT COUNT(artista_id) FROM artistas) as artistas,
(SELECT COUNT(album_id) FROM albuns ) as albuns;