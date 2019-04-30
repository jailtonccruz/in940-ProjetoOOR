--SUBCONSULTA COM IN (pegando os produtos que foram vendidos no 1o dia do ano)
select prod.id from produto prod
where prod.id in (select ped.id from pedido ped
where ped.id = prod.id and ped.data = '01/01/2019');

-- SUBCONSULTA COM ANY 