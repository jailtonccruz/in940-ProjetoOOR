ALTER TYPE Tp_FuncionarioEfetivo
    ADD STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, salario_ NUMBER),
    ADD MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER),
    ADD MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER, data_ DATE)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS


    -- Cadastra um novo funcionario
    STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, salario_ NUMBER) IS
        BEGIN
            INSERT INTO Tb_FuncionarioEfetivo
            VALUES (Tp_FuncionarioEfetivo(cpf_, nome_, Ar_Fone(telefone_), endereco_, Tp_Rel_Emite(), salario_));
            DBMS_OUTPUT.PUT_LINE('funcionario efetivo criado');
            DBMS_OUTPUT.PUT_LINE('    cpf: ' || cpf_);
            DBMS_OUTPUT.PUT_LINE('    nome: ' || nome_);
        END;


    -- Movimenta o produto recebido, indicando se a moviemntação é de entrada 'E' ou saída 'S', e a quantidade
    -- A data atual é usada na movimentação
    MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER) IS
        data_ DATE := NULL;
        BEGIN
            SELECT SYSDATE INTO data_ FROM DUAL;
            SELF.movimentaProduto(produto_, tipo_, quantidade_, data_);
        END;


    -- Movimenta o produto recebido, indicando se a moviemntação é de entrada 'E' ou saída 'S', e a quantidade e data
    MEMBER PROCEDURE movimentaProduto (produto_ Tp_Produto, tipo_ CHAR, quantidade_ NUMBER, data_ DATE) IS
        estoqueFinal NUMBER := NULL;
        BEGIN
            IF tipo_ = 'S' AND produto_.estoque < quantidade_ THEN
                DBMS_OUTPUT.PUT_LINE('movimentação ilegal de saida : estoque < quantidade');
            ELSE
                INSERT INTO Tb_Rel_Movimenta
                VALUES (
                           Tp_Rel_Movimenta(
                                       (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpf = SELF.cpf),
                                       (SELECT REF(p) FROM Tb_Produto p WHERE p.cod = produto_.cod),
                                       data_,
                                       tipo_,
                                       quantidade_
                               )
                       );

                IF tipo_ = 'S' THEN
                    estoqueFinal := produto_.estoque - quantidade_;
                ELSE
                    estoqueFinal := produto_.estoque + quantidade_;
                END IF;


                DBMS_OUTPUT.PUT_LINE('produto: ' || produto_.nome);
                DBMS_OUTPUT.PUT_LINE('  estoque anterior: ' || produto_.estoque);
                UPDATE Tb_Produto p SET p.estoque = estoqueFinal WHERE p.cod = produto_.cod;
                DBMS_OUTPUT.PUT_LINE('  estoque atual: ' || estoqueFinal);

            END IF;
        END;

END;
/
