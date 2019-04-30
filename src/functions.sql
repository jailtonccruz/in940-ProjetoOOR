ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION orderPorSalario RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    MEMBER FUNCTION orderPorSalario RETURN NUMBER IS
    BEGIN
        RETURN (salario);
    END;
END;
/

-- Function para checar a necessidade de solicitar novos produtos para o estoque

ALTER TYPE TP_PRODUTO ADD MEMBER FUNCTION solicitarCompra RETURN BOOLEAN CASCADE;

CREATE OR REPLACE TYPE BODY TP_PRODUTO AS
    MEMBER FUNCTION solicitarCompra RETURN BOOLEAN IS
        BEGIN
            RETURN ESTOQUE < LIMIARPEDIDO;
        END;
END;
/


ALTER TYPE TP_PRODUTO ADD MEMBER PROCEDURE exibirDetalhes (SELF TP_PRODUTO) CASCADE;

CREATE OR REPLACE TYPE BODY TP_PRODUTO AS
    MEMBER PROCEDURE exibirDetalhes (SELF TP_PRODUTO) IS
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Detalhes de um Projeto');
            DBMS_OUTPUT.PUT_LINE('Nome: ' ||NOME);
            DBMS_OUTPUT.PUT_LINE('Estoque: ' || TO_CHAR(ESTOQUE));
            DBMS_OUTPUT.PUT_LINE('Valor: ' || 'R$. ' || TO_CHAR(valor));
            DBMS_OUTPUT.PUT_LINE('Limiar: ' || TO_CHAR(LIMIARPEDIDO));

        END;
END;

/
-- Function para checar se o cliente tem direito a frete grátis (UF = PE)

ALTER TYPE TP_CLIENTE ADD MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN CASCADE ;

CREATE OR REPLACE TYPE BODY TP_CLIENTE AS
    MEMBER FUNCTION checaFreteGratis RETURN BOOLEAN IS
        BEGIN

            RETURN ENDERECO.UF = 'PE';
        END;
END;
/



-- INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (TP_FUNCIONARIOEFETIVO(123, 'NOME', AR_FONE(), TP_ENDERECO('', '', '', 'as'), TP_REL_EMITE(), 2222));
-- select fe.orderPorSalario() from Tb_FuncionarioEfetivo fe

