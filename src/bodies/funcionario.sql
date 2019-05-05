ALTER TYPE Tp_Funcionario
    ADD MEMBER PROCEDURE vende (cliente_ Tp_Cliente, produtos_ Ar_Produto, quantidade_ Ar_Number)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Funcionario AS

    -- Realiza um venda de produtos criando o pedido, relacionando-o com os produtos, ao funcionado e ao cliente
    -- TODO adicionar promocoes, checar estoque
    MEMBER PROCEDURE vende (cliente_ Tp_Cliente, produtos_ Ar_Produto, quantidade_ Ar_Number) IS
        pedido_ Tp_Pedido := NULL;
        pedidoRef_ REF Tp_Pedido := NULL;
        efetivo_ NUMBER := 0;
        BEGIN
            pedido_ := Tp_Pedido.cadastra();
            SELECT REF(p) INTO pedidoRef_ FROM Tb_Pedido p WHERE p.cod = pedido_.cod;

            FOR i IN 1..produtos_.COUNT
                LOOP
                    INSERT INTO Tb_Rel_Inclui
                    VALUES (Tp_Rel_Inclui(
                            pedidoRef_,
                            (SELECT REF(p) FROM Tb_Produto p WHERE p.cod = produtos_(i).cod),
                            quantidade_(i),
                            produtos_(i).valor
                        ));
                    DBMS_OUTPUT.PUT_LINE('produto add: ' || produtos_(i).nome || ', qtd: ' || quantidade_(i));
                END LOOP;

            INSERT INTO TABLE (SELECT c.faz FROM Tb_Cliente c WHERE c.cpf = cliente_.cpf)
            VALUES (pedidoRef_);
            DBMS_OUTPUT.PUT_LINE('pedido => cliente: ' || cliente_.nome);

            SELECT COUNT(*) INTO efetivo_ FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf;
            IF efetivo_ <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('funcionario efetivo');
                INSERT INTO TABLE (SELECT f.emite FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf)
                VALUES (pedidoRef_);

            ELSE
                DBMS_OUTPUT.PUT_LINE('funcionario terceirizado');
                INSERT INTO TABLE (SELECT f.emite FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = SELF.cpf)
                VALUES (pedidoRef_);
            END IF;

            DBMS_OUTPUT.PUT_LINE('pedido => funcionario: ' || SELF.nome);
        END;

END;
/