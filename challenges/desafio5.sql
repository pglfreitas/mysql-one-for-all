SELECT
c.cancao_nome AS cancao,
COUNT(h.cancao_id) AS reproducoes
FROM 
cancoes AS c
INNER JOIN historico AS h 
ON h.cancao_id = c.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2