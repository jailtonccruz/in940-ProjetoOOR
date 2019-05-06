-- 10 
-- SUBCONSULTA COM IN (pegando os produtos que NÃO foram vendidos)

SELECT pro.cod, pro.nome
  FROM tb_produto pro
 WHERE pro.cod NOT IN
(select DEREF(r.produto).cod
   FROM tb_rel_inclui r)

-- 11 (uso do IN) e 43 (uso do DEREF)
-- Fazer uma consulta que mostre todos os Produtos com nome ITALAC
--
SELECT *
  FROM TB_PRODUTO pro
 WHERE upper(pro.nome) like '%ITALAC%' 

-- 20 
-- SUBCONSULTA COM ALL

SELECT cpf.func, nome.func, salario FROM tb_funcionarioefetivo func 
WHERE salario > ALL (SELECT salario FROM tb_funcionarioefetivo WHERE departamento.func = '1');

-- ORDEY BY 
SELECT cpf.func, nome.func, salario FROM tb_funcionarioefetivo func ORDER BY (salario) DESC;

-- SUBCONSULTA COM ANY 
select c.nome, cf.pedido.cod from Tb_cliente c inner join TABLE(c.faz) cf ON c.cpf is not null 
where cf.pedido.cod = any (Select DEREF(ri.pedido).cod from Tb_Rel_inclui ri where ri.produto.nome = 'Pringles');
