ALTER TYPE Tp_Sessao
    ADD STATIC PROCEDURE cadastra (nome_ VARCHAR2),
    ADD MEMBER PROCEDURE registraProduto (produto_ Tp_Produto)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Sessao AS


    -- Cadastra uma nova sessão
    STATIC PROCEDURE cadastra (nome_ VARCHAR2) IS
        cod_ NUMBER := Sq_Sessao.nextval;
        BEGIN
            INSERT INTO Tb_Sessao
            VALUES (Tp_Sessao(cod_, nome_, Tp_Rel_Contem()));
            DBMS_OUTPUT.PUT_LINE('sessao criada');
            DBMS_OUTPUT.PUT_LINE('    cod: ' || cod_);
            DBMS_OUTPUT.PUT_LINE('    nome: ' || nome_);
        END;


    -- Adiciona o produto nesta sessão
    -- Se o produto já está em outra sessão, é movido para esta.
    MEMBER PROCEDURE registraProduto (produto_ Tp_Produto) IS
        emSessao NUMBER := 0;
        CURSOR sessoes IS (
            SELECT *
            FROM Tb_Sessao
        );
        sessaoAtual sessoes%ROWTYPE := NULL;
        BEGIN
            FOR sessao IN sessoes
                LOOP
                    SELECT COUNT(*) into emSessao
                    FROM TABLE (sessao.contem) t
                    WHERE t.produto.cod = produto_.cod;
                    IF emSessao > 0 THEN
                        sessaoAtual := sessao;
                        EXIT;
                    END IF;
                END LOOP;

            IF sessaoAtual.cod IS NOT NULL THEN
                DELETE
                FROM TABLE (SELECT s.contem FROM Tb_Sessao s WHERE s.cod = sessaoAtual.cod) t
                WHERE t.produto.cod = produto_.cod;
                DBMS_OUTPUT.PUT_LINE('removido da sessão: ' || sessaoAtual.nome);
            END IF;

            INSERT INTO TABLE (SELECT s.contem FROM Tb_Sessao s WHERE s.cod = SELF.cod)
            VALUES ((SELECT ref(p) FROM Tb_Produto p WHERE p.cod = produto_.cod));

            DBMS_OUTPUT.PUT_LINE('adicionado a sessão: ' || nome);
        END;

END;
/
