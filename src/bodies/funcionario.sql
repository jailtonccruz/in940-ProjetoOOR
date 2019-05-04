ALTER TYPE Tp_Funcionario
    ADD MEMBER PROCEDURE realizaVenda (cliente_ Tp_Cliente, produtos_ Ar_Produtos, quantidade_ Ar_Numbers)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Funcionario AS


    -- Realiza um venda de produtos criando o pedido, relacionando-o com os produtos, ao funcionado e ao cliente
    MEMBER PROCEDURE realizaVenda (cliente_ Tp_Cliente, produtos_ Ar_Produtos, quantidade_ Ar_Numbers) IS
        pedido_ Tp_Pedido := NULL;
        pedidoRef_ REF Tp_Pedido := NULL;
        emEfetivo NUMBER := 0;
        BEGIN
            pedido_ := Tp_Pedido.cadastraRetorna();
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
                    DBMS_OUTPUT.PUT_LINE('adicionado ao pedido o produto: ' || produtos_(i).nome);
                END LOOP;

            INSERT INTO TABLE (SELECT c.faz FROM Tb_Cliente c WHERE c.cpf = cliente_.cpf)
            VALUES (pedidoRef_);
            DBMS_OUTPUT.PUT_LINE('pedido registrado ao cliente: ' || cliente_.nome);

            SELECT COUNT(*) INTO emEfetivo FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf;
            IF emEfetivo <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('funcionario do tipo efetivo');
                INSERT INTO TABLE (SELECT f.emite FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf)
                VALUES (pedidoRef_);

            ELSE
                DBMS_OUTPUT.PUT_LINE('funcionario do tipo terceirizado');
                INSERT INTO TABLE (SELECT f.emite FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = SELF.cpf)
                VALUES (pedidoRef_);
            END IF;

            DBMS_OUTPUT.PUT_LINE('pedido registrado ao funcionario: ' || SELF.nome);
        END;

END;
/