SELECT
u.usuario_nome AS pessoa_usuaria,
COUNT(h.cancao_id) AS musicas_ouvidas,
ROUND(SUM(c.duracao_segundos)/60,2) AS total_minutos
FROM 
usuarios AS u
INNER JOIN historico AS h 
ON h.usuario_id = u.usuario_id
INNER JOIN cancoes AS c 
ON h.cancao_id = c.cancao_id
GROUP BY pessoa_usuaria ORDER BY pessoa_usuaria