ALTER TYPE Tp_FuncionarioEfetivo
    ADD STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco, salario_ NUMBER) RETURN Tp_FuncionarioEfetivo,
    ADD MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER),
    ADD MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER, data_ DATE)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS

    -- Cadastra um novo funcionario
    STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco, salario_ NUMBER) RETURN Tp_FuncionarioEfetivo IS
        funcionario_ Tp_FuncionarioEfetivo := Tp_FuncionarioEfetivo(cpf_, nome_, telefone_, endereco_, Tp_Rel_Emite(),
                                                                    salario_);
        BEGIN
            INSERT INTO Tb_FuncionarioEfetivo VALUES (funcionario_);
            DBMS_OUTPUT.PUT_LINE('funcionario efetivo => cpf: ' || funcionario_.cpf || ', nome: ' || funcionario_.nome);
            RETURN funcionario_;
        END;


    -- Movimenta o produto recebido, indicando se a moviemntação é de entrada 'E' ou saída 'S', e a quantidade
    -- A data atual é usada na movimentação
    MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER) IS
        BEGIN
            SELF.movimentaProduto(produto_, tipo_, quantidade_, SYSDATE);
        END;


    -- Movimenta o produto recebido, indicando se a moviemntação é de entrada 'E' ou saída 'S', quantidade e a data
    MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER, data_ DATE) IS
        estoqueAnterior_ NUMBER := NULL; -- nescessário obter pois produto_ pode estar desatualizado
        estoqueResultante_ NUMBER := NULL;
        BEGIN
            SELECT p.estoque into estoqueAnterior_ FROM Tb_Produto p WHERE p.cod = produto_.cod;
            IF tipo_ = 'S' AND estoqueAnterior_ < quantidade_ THEN
                DBMS_OUTPUT.PUT_LINE('movimentação ilegal de saida : estoque < quantidade');
            ELSE
                INSERT INTO Tb_Rel_Movimenta
                VALUES (Tp_Rel_Movimenta(
                            (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf),
                            (SELECT REF(p) FROM Tb_Produto p WHERE p.cod = produto_.cod),
                            data_,
                            tipo_,
                            quantidade_
                    ));

                IF tipo_ = 'S' THEN
                    estoqueResultante_ := estoqueAnterior_ - quantidade_;
                ELSE
                    estoqueResultante_ := estoqueAnterior_ + quantidade_;
                END IF;

                UPDATE Tb_Produto p SET p.estoque = estoqueResultante_ WHERE p.cod = produto_.cod;
                DBMS_OUTPUT.PUT_LINE('produto: ' || produto_.nome);
                DBMS_OUTPUT.PUT_LINE('  estoque anterior: ' || estoqueAnterior_);
                DBMS_OUTPUT.PUT_LINE('  estoque atual: ' || estoqueResultante_);

            END IF;
        END;

END;
/
