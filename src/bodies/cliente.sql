ALTER TYPE Tp_Cliente
    ADD STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_),
    ADD MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN,
    ADD MEMBER FUNCTION valorGasto (de DATE, ate DATE) RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Cliente AS


    -- Cadastra um novo cliente.
    STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco) IS
        BEGIN
            INSERT INTO Tb_Cliente
            VALUES (
                       Tp_Cliente(cpf_, nome_, Ar_Fone(telefone_), endereco_, Tp_Rel_Emite())
                   );
        END;


    -- Function para checar se o cliente tem direito a frete grátis (UF = PE)
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
