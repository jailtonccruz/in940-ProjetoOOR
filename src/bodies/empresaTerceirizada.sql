ALTER TYPE Tp_EmpresaTerceirizada
    ADD STATIC FUNCTION cadastra (nome_ VARCHAR2) RETURN Tp_EmpresaTerceirizada
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_EmpresaTerceirizada AS

    -- Cadastra nova empresa terceirizada
    STATIC FUNCTION cadastra (nome_ VARCHAR2) RETURN Tp_EmpresaTerceirizada IS
        empresa_ Tp_EmpresaTerceirizada := Tp_EmpresaTerceirizada(seq.nextval, nome_, Tp_Rel_Trabalha());
        BEGIN
            INSERT INTO Tb_EmpresaTerceirizada VALUES (empresa_);
            DBMS_OUTPUT.PUT_LINE('empresa => cod: ' || empresa_.cod || ', nome: ' || empresa_.nome);
            RETURN empresa_;
        END;

END;
/
