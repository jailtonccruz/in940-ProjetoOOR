--SUBCONSULTA COM IN (pegando os produtos que foram vendidos no 1o dia do ano)
select prod.cod from tb_produto prod
where prod.cod in (select ped.cod from tb_pedido ped
where ped.cod = prod.cod and ped.data = '01/01/2018');

-- SUBCONSULTA COM ANY 
