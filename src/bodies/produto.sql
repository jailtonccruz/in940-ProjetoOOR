ALTER TYPE Tp_Produto
    ADD STATIC FUNCTION cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER) RETURN Tp_Produto
    CASCADE;


CREATE OR REPLACE TYPE BODY Tp_Produto AS

    -- Cadastra novo produto
    STATIC FUNCTION cadastra (nome_ VARCHAR2, valor_ NUMBER, estoque_ NUMBER, limiarPedido_ NUMBER) RETURN Tp_Produto IS
        produto_ Tp_Produto := Tp_Produto(seq.nextval, nome_, valor_, estoque_, limiarPedido_);
        BEGIN
            INSERT INTO Tb_Produto VALUES (produto_);
            DBMS_OUTPUT.PUT_LINE('produto => cod: ' || produto_.cod || ', nome: ' || produto_.nome);
            RETURN produto_;
        END;

END;
/

-- trigger aviso limiar 
create or replace trigger observa_limiar AFTER
update on tb_produto for each row 
begin 
    if :New.estoque < :New.limiarPedido
    then dbms_output.put_line('ESTOQUE ABAIXO DO LIMIAR: ' || :New.nome);
    END IF;
END;