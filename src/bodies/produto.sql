ALTER TYPE Tp_Produto
    ADD STATIC FUNCTION cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER) RETURN Tp_Produto,
    ADD ORDER MEMBER FUNCTION orderByEstoque(produto_ Tp_Produto) RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Produto AS

    -- Cadastra novo produto
    STATIC FUNCTION cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER) RETURN Tp_Produto IS
        produto_ Tp_Produto := Tp_Produto(seq.nextval, nome_, valor_, estoque_, limiarPedido_);
        BEGIN
            INSERT INTO Tb_Produto VALUES (produto_);
            DBMS_OUTPUT.PUT_LINE('produto => cod: ' || produto_.cod || ', nome: ' || produto_.nome);
            RETURN produto_;
        END;

    ORDER MEMBER FUNCTION orderByEstoque(produto_ Tp_Produto) RETURN NUMBER IS
        BEGIN
            return SELF.estoque - produto_.estoque;
        END;
END;
/

-- trigger aviso limiar 
CREATE OR REPLACE TRIGGER observaLimiar
    AFTER
        UPDATE
    ON Tb_Produto
    FOR EACH ROW
BEGIN
    IF :NEW.estoque < :NEW.limiarPedido THEN
        dbms_output.put_line('ESTOQUE ABAIXO DO LIMIAR: ' || :NEW.nome);
    END IF;
END;