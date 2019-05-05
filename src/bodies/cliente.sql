ALTER TYPE Tp_Cliente
    ADD STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco) RETURN Tp_Cliente,
    ADD MEMBER FUNCTION valorGasto (de_ DATE, ate_ DATE) RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Cliente AS

    -- Cadastra novo cliente
    STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco) RETURN Tp_Cliente IS
        cliente_ Tp_Cliente := Tp_Cliente(cpf_, nome_, telefone_, endereco_, Tp_Rel_Faz());
        BEGIN
            INSERT INTO Tb_Cliente VALUES (cliente_);
            DBMS_OUTPUT.PUT_LINE('cliente => cpf: ' || cliente_.cpf || ', nome: ' || cliente_.nome);
            RETURN cliente_;
        END;


    -- Calcula o valor gasto pelo cliente no intervalo de datas
    -- TODO refazer
    MEMBER FUNCTION valorGasto (de_ DATE, ate_ DATE) RETURN NUMBER IS
        valorGasto NUMBER := 0;
        BEGIN
            -- SELECT INTO valorGasto FROM TABLE (SELECT c.faz FROM Tb_Cliente c WHERE c.cpf = SELF.cpf) t INNER JOIN Tb_Rel_Inclui ri ON t;
            --SELECT SUM(i.valorTotal()) INTO valorGasto
            --FROM (TABLE (faz) f INNER JOIN Tb_Rel_Inclui ri ON f.pedido.cod = ri.pedido.pedido.cod) i
            --WHERE f.faz.data BETWEEN de AND ate;
            RETURN valorGasto;
        END;
END;
/
