--SUBCONSULTA COM IN (pegando os produtos que foram vendidos no 1o dia do ano)
select prod.cod from tb_produto prod
where prod.cod in (select ped.cod from tb_pedido ped
where ped.cod = prod.cod and ped.data = '01/01/2018');

-- SUBCONSULTA COM ANY 


--- Seleciona os funcionários por ordem de quantidade de pedidos e armazena em uma view

--Create view funcOrdenadosPedidos as (


select te.nome as nome, te.vendasFeitas() as vendas from TB_FUNCIONARIOEFETIVO te
UNION
select tt.nome as nome, tt.vendasFeitas() as vendas from TB_FUNCIONARIOTERCEIRIZADO tt;



order by vendas



;


DECLARE
    BEGIN

    select f.vendasFeitas() from TB_FUNCIONARIOEFETIVO f;


 select count(*) from table (SELECT f.EMITE from TB_FUNCIONARIOEFETIVO f t) t;



 END;

SELECT count (PEDIDO) from TB_FUNCIONARIOEFETIVO where MONTH (PEDIDO.date) = Month (SYSDATE());

 where MONTH (PEDIDO.date) = MONTH (SYSDATE);

 AND YEAR (PEDIDO.date);