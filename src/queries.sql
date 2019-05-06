--SUBCONSULTA COM IN (pegando os produtos que NÃO foram vendidos)

SELECT pro.cod, pro.nome
  FROM tb_produto pro
 WHERE pro.cod NOT IN
(select DEREF(r.produto).cod
   FROM tb_rel_inclui r)

-- SUBCONSULTA COM ANY 
