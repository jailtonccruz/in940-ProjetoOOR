ALTER TYPE TP_PEDIDO
    ADD STATIC FUNCTION cadastraRetorna RETURN Tp_Pedido,
    ADD MEMBER FUNCTION valorTotal RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Pedido AS


    -- Cadastra um novo pedido vazio e o retorna
    STATIC FUNCTION cadastraRetorna RETURN Tp_Pedido IS
        cod_ NUMBER := Sq_Pedido.nextval;
        pedido_ Tp_Pedido := NULL;
        BEGIN
            pedido_ := Tp_Pedido(cod_, SYSDATE);
            INSERT INTO Tb_Pedido VALUES (pedido_);
            DBMS_OUTPUT.PUT_LINE('pedido criado');
            DBMS_OUTPUT.PUT_LINE('    cod: ' || cod_);
            RETURN pedido_;
        END;


    -- Calcula o valor total do pedido.
    MEMBER FUNCTION valorTotal RETURN NUMBER IS
        total NUMBER := 0;
        BEGIN
            SELECT SUM(ri.quantidade * ri.valor) INTO total FROM Tb_Rel_Inclui ri WHERE ri.pedido.cod = SELF.cod;
            RETURN total;
        END;
END;
/
