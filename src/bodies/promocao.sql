ALTER TYPE Tp_Promocao
    ADD STATIC FUNCTION cadastra (quantidade_ NUMBER, desconto_ NUMBER, de_ DATE, ate_ DATE, produto_ Tp_Produto) RETURN Tp_Promocao
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Promocao AS

    -- Cadastra nova promoção
    STATIC FUNCTION cadastra (quantidade_ NUMBER, desconto_ NUMBER, de_ DATE, ate_ DATE, produto_ Tp_Produto) RETURN Tp_Promocao IS
        produtoRef_ REF Tp_produto := NULL;
        promocao_ Tp_Promocao := NULL;
        BEGIN
            SELECT REF(p) INTO produtoRef_ FROM Tb_Produto p WHERE p.cod = produto_.cod;
            promocao_ := Tp_Promocao(seq.nextval, quantidade_, desconto_, de_, ate_, produtoRef_);
            INSERT INTO Tb_Promocao VALUES (promocao_);
            DBMS_OUTPUT.PUT_LINE('promocao => cod: ' || promocao_.cod);
            RETURN promocao_;
        END;

END;
/
