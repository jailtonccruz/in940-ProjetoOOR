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
