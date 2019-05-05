ALTER TYPE Tp_Departamento
    ADD STATIC FUNCTION cadastra (nome_ VARCHAR2, sigla_ VARCHAR2) RETURN Tp_Departamento,
    ADD MEMBER PROCEDURE registraFuncionario (funcionario_ Tp_Funcionario)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_Departamento AS

    -- Cadastra novo departamento
    STATIC FUNCTION cadastra (nome_ VARCHAR2, sigla_ VARCHAR2) RETURN Tp_Departamento IS
        departamento_ Tp_Departamento := Tp_Departamento(seq.nextval, nome_, sigla_, Tp_Rel_Pertence());
        BEGIN
            INSERT INTO Tb_Departamento VALUES (departamento_);
            DBMS_OUTPUT.PUT_LINE('departamento => cod: ' || departamento_.cod || ', nome: ' || departamento_.nome);
            RETURN departamento_;
        END;


    -- Adiciona funcionario a este departamento
    MEMBER PROCEDURE registraFuncionario (funcionario_ Tp_Funcionario) IS
        emDepartamento_ NUMBER := 0;
        CURSOR departamentos_ IS (
            SELECT *
            FROM Tb_Departamento
        );
        departamento_ departamentos_%ROWTYPE := NULL;
        efetivo_ NUMBER := 0;
        BEGIN
            FOR d IN departamentos_
                LOOP
                    SELECT COUNT(*) into emDepartamento_
                    FROM TABLE (d.pertence) t
                    WHERE t.funcionario.cpf = funcionario_.cpf;
                    IF emDepartamento_ > 0 THEN
                        departamento_ := d;
                        EXIT;
                    END IF;
                END LOOP;

            IF departamento_.cod IS NOT NULL THEN
                DELETE
                FROM TABLE (SELECT d.pertence FROM Tb_Departamento d WHERE d.cod = departamento_.cod) t
                WHERE t.funcionario.cpf = funcionario_.cpf;
                DBMS_OUTPUT.PUT_LINE('removido do departamento: ' || departamento_.nome);
            END IF;

            SELECT COUNT(*) INTO efetivo_ FROM Tb_FuncionarioEfetivo f WHERE f.cpf = funcionario_.cpf;
            IF efetivo_ <> 0 THEN
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
