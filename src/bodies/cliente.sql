-- Function para checar se o cliente tem direito a frete grátis (UF = PE)

ALTER TYPE TP_CLIENTE ADD MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN CASCADE;
ALTER TYPE TP_CLIENTE ADD MEMBER FUNCTION valorGasto (de DATE, ate DATE) RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_Cliente AS

    MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN IS
        BEGIN

            RETURN ENDERECO.UF = 'PE';
        END;

    MEMBER FUNCTION valorGasto (de DATE, ate DATE) RETURN BOOLEAN IS
        valorGasto NUMBER;
        BEGIN
            valorGasto := 0;

            SELECT * FROM TABLE (faz);
            --SELECT SUM(i.valorTotal()) INTO valorGasto FROM (TABLE (faz) f INNER JOIN Tb_Rel_Inclui ri ON f.faz.cod = ri.pedido.pedido.cod) i;
            --WHERE f.faz.data BETWEEN de AND ate;
            RETURN valorGasto;
        END;
END;
/

select * from TB_CLIENTE
