-- SUBCONSULTA COM IN (pegando os produtos que NÃO foram vendidos)

SELECT pro.cod, pro.nome
FROM tb_produto pro
WHERE pro.cod NOT IN
      (select DEREF(r.produto).cod
       FROM tb_rel_inclui r);

-- 11 (uso do IN) e 43 (uso do DEREF)
-- Fazer uma consulta que mostre todos os Produtos com nome ITALAC
--
SELECT *
FROM TB_PRODUTO pro
WHERE UPPER(pro.nome) like '%ITALAC%';

-- 20 
-- SUBCONSULTA COM ALL
SELECT f.cpf, f.nome, f.salario
FROM tb_funcionarioefetivo f
WHERE f.salario > ALL (SELECT fe.salario as salario
                       FROM TABLE (SELECT d.pertence FROM Tb_Departamento d WHERE d.cod = 1) t
                                INNER JOIN
                            TB_FUNCIONARIOEFETIvo fe
                            ON t.funcionario.cpf = fe.cpf);


-- ORDEY BY
SELECT f.cpf, f.nome, f.salario
FROM tb_funcionarioefetivo f
ORDER BY (f.salario) DESC;

-- SUBCONSULTA COM ANY 
select c.nome, cf.pedido.cod
from Tb_cliente c
         inner join TABLE (c.faz) cf ON c.cpf is not null
where cf.pedido.cod = any (Select DEREF(ri.pedido).cod from Tb_Rel_inclui ri where ri.produto.nome = 'Pringles');


--- Seleciona os funcionários por ordem de quantidade de pedidos e armazena em uma view
CREATE VIEW funcOrdenadosPedidos AS
    SELECT te.nome as nome, te.vendasFeitas() AS vendas
    FROM TB_FUNCIONARIOEFETIVO te
    UNION
    SELECT tt.nome as nome, tt.vendasFeitas() AS vendas
    FROM TB_FUNCIONARIOTERCEIRIZADO tt
    ORDER BY vendas DESC
;
SELECT *
FROM funcOrdenadosPedidos;
-- DROP VIEW funcOrdenadosPedidos;
--

-- Consulta com group by e having
select ri.pedido.data as data, sum(ri.produto.valor) as valorTotal, ri.produto.nome
from tb_rel_inclui ri
GROUP BY ri.pedido.data, ri.produto.nome
having ri.produto.nome = 'Pringles';

-- Testando map
SELECT *
FROM Tb_Cliente c
ORDER BY c.mapNome();