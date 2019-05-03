ALTER TYPE TP_PEDIDO ADD MEMBER FUNCTION qtd_produtos_comprados (id NUMBER) RETURN VARCHAR2 CASCADE;

CREATE OR REPLACE TYPE BODY tp_pedido AS
	MEMBER FUNCTION qtd_produtos_comprados (id NUMBER) RETURN VARCHAR2 IS
	qtd NUMBER := (select count(p.produto) from Tb_Rel_Inclui p
		where p.pedido = id);
	BEGIN
  		RETURN qtd;
	END;
END;
/
