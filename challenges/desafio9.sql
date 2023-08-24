SELECT
COUNT(h.cancao_id) AS musicas_no_historico
FROM 
usuarios AS u
INNER JOIN historico AS h 
ON u.usuario_id = h.usuario_id
WHERE usuario_nome = 'Barbara Liskov'
