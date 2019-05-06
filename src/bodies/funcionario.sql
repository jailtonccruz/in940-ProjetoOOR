ALTER TYPE Tp_Funcionario
    ADD MEMBER PROCEDURE vende (cliente_ Tp_Cliente, produtos_ Ar_Produto, quantidade_ Ar_Number),
    Add Member function vendasFeitas return number
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Funcionario AS

    -- Realiza um venda de produtos criando o pedido, relacionando-o com os produtos, ao funcionado e ao cliente
    -- TODO adicionar promocoes
    MEMBER PROCEDURE vende (cliente_ Tp_Cliente, produtos_ Ar_Produto, quantidade_ Ar_Number) IS
        pedido_ Tp_Pedido := NULL;
        pedidoRef_ REF Tp_Pedido := NULL;
        efetivo_ NUMBER := 0;
        produtoAtual_ Tp_Produto := NULL;
        produtoRef_ REF Tp_Produto := NULL;
        temPromocao_ NUMBER := 0;
        promocao_ Tp_Promocao := NULL;
        promocaoRef_ REF Tp_Promocao := NULL;
        BEGIN
            SAVEPOINT antesDePedido;
            pedido_ := Tp_Pedido.cadastra();
            SELECT REF(p) INTO pedidoRef_ FROM Tb_Pedido p WHERE p.cod = pedido_.cod;

            IF produtos_.COUNT = 0 THEN
                DBMS_OUTPUT.PUT_LINE('Nenhum produto recebido');
                DBMS_OUTPUT.PUT_LINE('DESFAZENDO TRANSAÇÃO');
                ROLLBACK TO antesDePedido;
                RETURN;
            END IF;

            IF produtos_.COUNT <> quantidade_.COUNT THEN
                DBMS_OUTPUT.PUT_LINE('Produtos e quantidades de tamanhos diferentes');
                DBMS_OUTPUT.PUT_LINE('DESFAZENDO TRANSAÇÃO');
                ROLLBACK TO antesDePedido;
                RETURN;
            END IF;

            FOR i IN 1..produtos_.COUNT
                LOOP
                    SELECT VALUE(p),
                           REF(p)
                           INTO produtoAtual_, produtoRef_
                    FROM Tb_Produto p
                    WHERE p.cod = produtos_(i).cod;

                    IF quantidade_(i) <= 0 THEN
                        DBMS_OUTPUT.PUT_LINE('quantidade illegal');
                        DBMS_OUTPUT.PUT_LINE('DESFAZENDO TRANSAÇÃO');
                        ROLLBACK TO antesDePedido;
                        RETURN;
                    END IF;

                    IF produtoAtual_.estoque < quantidade_(i) THEN
                        DBMS_OUTPUT.PUT_LINE('estoque insuficiente de: ' || produtoAtual_.nome);
                        DBMS_OUTPUT.PUT_LINE('DESFAZENDO TRANSAÇÃO');
                        ROLLBACK TO antesDePedido;
                        RETURN;
                    END IF;

                    -- promoção
                    SELECT COUNT(*) INTO temPromocao_ FROM Tb_Promocao p
                    WHERE p.produto.cod = produtos_(i).cod
                        AND p.quantidade <= quantidade_(i)
                        AND pedido_.data BETWEEN p.de AND p.ate;


                    DBMS_OUTPUT.PUT_LINE('teste ' || temPromocao_);
--                     SELECT VALUE(p),
--                            REF(p)
--                            INTO promocao_, promocaoRef_
--                     FROM Tb_Promocao p
--                     WHERE p.produto.cod = produtos_(i).cod
--                       AND p.quantidade <= quantidade_(i)
--                       AND pedido_.data BETWEEN p.de AND p.ate;

--                     IF promocao_ IS NOT NULL THEN
--                         DBMS_OUTPUT.PUT_LINE('promocao not null: ' || promocao_.COD);
--                     ELSE
--                         DBMS_OUTPUT.PUT_LINE('promocao null: ');
--                     END IF;


                    INSERT INTO Tb_Rel_Inclui
                    VALUES (Tp_Rel_Inclui(
                            pedidoRef_,
                            (SELECT REF(p) FROM Tb_Produto p WHERE p.cod = produtos_(i).cod),
                            quantidade_(i),
                            produtos_(i).valor,
                            produtos_(i).valor
                        ));

                    UPDATE Tb_Produto p
                    SET p.estoque = (produtoAtual_.estoque - quantidade_(i))
                    WHERE p.cod = produtos_(i).cod;

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

    MEMBER FUNCTION vendasFeitas return NUMBER IS
    efetivo_ NUMBER := 0;
    contagem NUMBER := 0;
    BEGIN
    SELECT COUNT(*) INTO efetivo_ FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf;
            IF efetivo_ <> 0 THEN
     SELECT COUNT (*) INTO contagem FROM TABLE(select f.emite from Tb_FuncionarioEfetivo f where f.cpf = SELF.cpf);
     ELSE
     SELECT COUNT (*) INTO contagem FROM TABLE(select f.emite from Tb_FuncionarioTerceirizado f where f.cpf = SELF.cpf);
    END IF;
    RETURN contagem;
    END;

END;
/