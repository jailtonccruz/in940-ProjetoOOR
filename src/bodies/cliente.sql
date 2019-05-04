ALTER TYPE Tp_Cliente
    ADD STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco),
    ADD MEMBER FUNCTION valorGasto (de DATE, ate DATE) RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Cliente AS


    -- Cadastra um novo cliente
    STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco) IS
        BEGIN
            INSERT INTO Tb_Cliente
            VALUES (Tp_Cliente(cpf_, nome_, Ar_Fone(telefone_), endereco_, Tp_Rel_Faz()));
            DBMS_OUTPUT.PUT_LINE('cliente criado');
            DBMS_OUTPUT.PUT_LINE('    cpf: ' || cpf_);
            DBMS_OUTPUT.PUT_LINE('    nome: ' || nome_);
        END;


    -- Calcula o valor gasto pelo cliente dado o intervalo de dadas
    MEMBER FUNCTION valorGasto (de DATE, ate DATE) RETURN NUMBER IS
        valorGasto NUMBER := 0;
        BEGIN
            --SELECT SUM(i.valorTotal()) INTO valorGasto
            --FROM (TABLE (faz) f INNER JOIN Tb_Rel_Inclui ri ON f.pedido.cod = ri.pedido.pedido.cod) i
            --WHERE f.faz.data BETWEEN de AND ate;
            RETURN valorGasto;
        END;
END;
/
