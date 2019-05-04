ALTER TYPE Tp_Produto
    ADD STATIC PROCEDURE cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER)
    CASCADE;


CREATE OR REPLACE TYPE BODY Tp_Produto AS

    STATIC PROCEDURE cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER) IS
        cod_ NUMBER := Sq_Produto.nextval;
        BEGIN
            INSERT INTO Tb_Produto VALUES (Tp_Produto(cod_, nome_, valor_, estoque_, limiarPedido_));
            DBMS_OUTPUT.PUT_LINE('produto criado');
            DBMS_OUTPUT.PUT_LINE('    nome: ' || nome_);
            DBMS_OUTPUT.PUT_LINE('    valor: RS ' || valor_);
            DBMS_OUTPUT.PUT_LINE('    estoque: ' || estoque_);
            DBMS_OUTPUT.PUT_LINE('    limiar pedido: ' || limiarPedido_);
        END;

END;

/
