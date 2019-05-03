
ALTER TYPE TP_PEDIDO ADD MEMBER FUNCTION qtd_produtos_comprados (id NUMBER) RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY tp_pedido AS
	MEMBER FUNCTION qtd_produtos_comprados (id NUMBER) RETURN NUMBER IS
	qtd NUMBER;
	BEGIN
	qtd := 'select count(p.produto) from Tb_Rel_Inclui p
		where p.pedido = id';
  		RETURN qtd;
	END;
END;
/
