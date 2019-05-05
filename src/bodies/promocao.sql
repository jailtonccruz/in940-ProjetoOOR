ALTER TYPE Tp_promocao
    ADD STATIC FUNCTION cadastra (quantidade_ NUMBER, desconto_ NUMBER, de_ DATE, ate_ DATE, produto_ Tp_Produto) RETURN Tp_Promocao,
    ADD MEMBER FUNCTION retornaDescontoDeProduto(codigo_p NUMBER) RETURN NUMBER,
    CASCADE;


CREATE OR REPLACE TYPE BODY Tp_promocao AS

    -- Cadastra nova promoção
    STATIC FUNCTION cadastra (quantidade_ NUMBER, desconto_ NUMBER, de_ DATE, ate_ DATE, produto_ Tp_Produto) RETURN Tp_Promocao IS
        promocao_ Tp_Promocao := Tp_Promocao(seq.nextval, quantidade_, desconto_, de_, ate_, NULL);
        BEGIN
            SELECT REF(p) INTO promocao_.produto FROM Tb_Produto p WHERE p.cod = produto_.cod;
            INSERT INTO Tb_Promocao VALUES (promocao_);
            DBMS_OUTPUT.PUT_LINE('promocao => cod: ' || promocao_.cod);
            RETURN promocao_;
        END;


CREATE OR REPLACE TYPE BODY tp_promocao AS
    
    MEMBER FUNCTION retornaDescontoDeProduto(codigo_p NUMBER) RETURN NUMBER IS
        retorno NUMBER := 0;
        codigo NUMBER := codigo_p;
        BEGIN 
            SELECT promo.desconto into retorno from tb_promocao promo where promo.produto.cod = codigo;
            RETURN retorno;
        END;

END;
/
