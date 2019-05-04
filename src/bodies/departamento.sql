ALTER TYPE Tp_Departamento
    ADD STATIC PROCEDURE cadastra (cod_ NUMBER, nome_ VARCHAR2, sigla_ VARCHAR2),
    ADD MEMBER PROCEDURE registraFuncionario (funcionario_ Tp_Funcionario)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Departamento AS


    -- Cadastra um novo departamento na base de dados
    STATIC PROCEDURE cadastra (cod_ NUMBER, nome_ VARCHAR2, sigla_ VARCHAR2) IS
        BEGIN
            INSERT INTO Tb_Departamento VALUES (Tp_Departamento(cod_, nome_, sigla_, Tp_Rel_Pertence()));
            DBMS_OUTPUT.PUT_LINE('departamento criado:' || nome_);
        END;


    -- Adiciona o funcionario neste departamento, se o funcionario já está em outro departamento, é movido para este.
    MEMBER PROCEDURE registraFuncionario (funcionario_ Tp_Funcionario) IS
        emDepartamento NUMBER := 0;
        CURSOR departamentos IS (
            SELECT *
            FROM Tb_Departamento
        );
        departamentoAtual departamentos%ROWTYPE := NULL;
        emEfetivo NUMBER := 0;
        BEGIN
            -- find previous employee's department
            FOR departamento IN departamentos
                LOOP
                    SELECT COUNT(*) into emDepartamento
                    FROM TABLE (departamento.pertence) t
                    WHERE t.funcionario.cpf = funcionario_.cpf;
                    IF emDepartamento > 0 THEN
                        departamentoAtual := departamento;
                        EXIT;
                    END IF;
                END LOOP;

            -- remove employee from the old department nested table
            IF departamentoAtual.cod IS NOT NULL THEN
                DBMS_OUTPUT.PUT_LINE('removendo do departamento: ' || departamentoAtual.nome);
                DELETE
                FROM TABLE (SELECT d.pertence FROM Tb_Departamento d WHERE d.cod = departamentoAtual.cod) t
                WHERE t.funcionario.cpf = funcionario_.cpf;
            END IF;

            -- add the employee to the new department nested table and update
            SELECT COUNT(*) INTO emEfetivo FROM Tb_FuncionarioEfetivo f WHERE f.cpf = funcionario_.cpf;
            IF emEfetivo <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('funcionario do tipo efetivo');
                INSERT INTO TABLE (SELECT d.pertence FROM Tb_Departamento d WHERE d.cod = SELF.cod)
                VALUES ((SELECT ref(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpf = funcionario_.cpf));
            ELSE
                DBMS_OUTPUT.PUT_LINE('funcionario do tipo terceirizado');
                INSERT INTO TABLE (SELECT d.pertence FROM Tb_Departamento d WHERE d.cod = SELF.cod)
                VALUES ((SELECT ref(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = funcionario_.cpf));
            END IF;
            DBMS_OUTPUT.PUT_LINE('adicionado ao departamento: ' || nome);

        END;

END;
/
