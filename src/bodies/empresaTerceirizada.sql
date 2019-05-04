ALTER TYPE Tp_EmpresaTerceirizada ADD STATIC PROCEDURE cadastra (cod_ NUMBER, nome_ VARCHAR2) CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_EmpresaTerceirizada AS

    -- Cadastra uma nova empresa terceirizada na base de dados
    STATIC PROCEDURE cadastra (cod_ NUMBER, nome_ VARCHAR2) IS
        BEGIN
            INSERT INTO Tb_EmpresaTerceirizada VALUES (Tp_EmpresaTerceirizada(cod_, nome_, Tp_Rel_Trabalha()));
        END;

END;
/
