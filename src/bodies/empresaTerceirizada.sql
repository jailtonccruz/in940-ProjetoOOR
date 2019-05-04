ALTER TYPE Tp_EmpresaTerceirizada
    ADD STATIC PROCEDURE cadastra (nome_ VARCHAR2)
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_EmpresaTerceirizada AS


    -- Cadastra uma nova empresa terceirizada na base de dados
    STATIC PROCEDURE cadastra (nome_ VARCHAR2) IS
        cod_ NUMBER := Sq_EmpresaTerceirizada.nextval;
        BEGIN
            INSERT INTO Tb_EmpresaTerceirizada
            VALUES (Tp_EmpresaTerceirizada(cod_, nome_, Tp_Rel_Trabalha()));
            DBMS_OUTPUT.PUT_LINE('empresa terceirizada criada');
            DBMS_OUTPUT.PUT_LINE('    cod: ' || cod_);
            DBMS_OUTPUT.PUT_LINE('    nome: ' || nome_);
        END;

END;
/
