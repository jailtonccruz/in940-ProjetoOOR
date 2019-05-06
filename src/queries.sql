--SUBCONSULTA COM IN (pegando os produtos que NÃO foram vendidos)

SELECT pro.cod, pro.nome
  FROM tb_produto pro
 WHERE pro.cod NOT IN
(select DEREF(r.produto).cod
   FROM tb_rel_inclui r)

-- SUBCONSULTA COM ANY (pegando os clientes que já compraram em algum pedido o produto Pringles)
select c.nome, cf.pedido.cod from Tb_cliente c inner join TABLE(c.faz) cf ON c.cpf is not null 
where cf.pedido.cod = any (Select DEREF(ri.pedido).cod from Tb_Rel_inclui ri where ri.produto.nome = 'Pringles');