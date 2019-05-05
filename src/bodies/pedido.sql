ALTER TYPE TP_PEDIDO
    ADD STATIC FUNCTION cadastra RETURN Tp_Pedido,
    ADD MEMBER FUNCTION valorTotal RETURN NUMBER,
    ADD MEMBER FUNCTION valorPromocao RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Pedido AS

    -- Cadastra novo pedido vazio
    STATIC FUNCTION cadastra RETURN Tp_Pedido IS
        cod_ NUMBER := seq.nextval;
        pedido_ Tp_Pedido := NULL;
        BEGIN
            pedido_ := Tp_Pedido(cod_, SYSDATE);
            INSERT INTO Tb_Pedido VALUES (pedido_);
            DBMS_OUTPUT.PUT_LINE('pedido => cod: ' || pedido_.cod);
            RETURN pedido_;
        END;


    -- Calcula valor total do pedido.
    MEMBER FUNCTION valorTotal RETURN NUMBER IS
        total NUMBER := 0;
        BEGIN
            SELECT SUM(ri.quantidade * ri.valor) INTO total FROM Tb_Rel_Inclui ri WHERE ri.pedido.cod = SELF.cod;
            RETURN total;
        END;

        -- Calcula valor do pedido com promoções.
        -- TODO implementar aplicações de promocoes
        MEMBER FUNCTION valorPromocao RETURN NUMBER IS
        total NUMBER := 0;
        BEGIN
            SELECT SUM(ri.quantidade * ri.valor) INTO total FROM Tb_Rel_Inclui ri WHERE ri.pedido.cod = SELF.cod;
            RETURN total;
        END;
END;
/
