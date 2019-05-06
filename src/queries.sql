-- 10 
-- SUBCONSULTA COM IN (pegando os produtos que NÃO foram vendidos)

SELECT pro.cod, pro.nome
  FROM tb_produto pro
 WHERE pro.cod NOT IN
(select DEREF(r.produto).cod
   FROM tb_rel_inclui r)

-- 11
-- Fazer uma consulta que mostre todos os Produtos com nome ITALAC
--
SELECT *
  FROM TB_PRODUTO pro
 WHERE upper(pro.nome) like '%ITALAC%' 

-- 20 
-- SUBCONSULTA COM ANY 

SELECT cpf.func, nome.func, salario FROM tb_funcionarioefetivo func 
WHERE salario > ALL (SELECT salario FROM tb_funcionarioefetivo WHERE departamento.func = '1');

-- ORDEY BY 
SELECT cpf.func, nome.func, salario FROM tb_funcionarioefetivo func ORDER BY (salario) DESC;
