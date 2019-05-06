--SUBCONSULTA COM IN (pegando os produtos que foram vendidos no 1o dia do ano)
select prod.cod
from tb_produto prod
where prod.cod in (select ped.cod
                   from tb_pedido ped
                   where ped.cod = prod.cod
                     and ped.data = '01/01/2018');



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
