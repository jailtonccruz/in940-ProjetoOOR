ALTER TYPE Tp_FuncionarioTerceirizado ADD STATIC PROCEDURE cadastraFuncionario (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, empresa_ Tp_EmpresaTerceirizada) CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_FuncionarioTerceirizado AS

    -- Cadastra uma novo funcionaro e o relaciona a empresa recebida.
    STATIC PROCEDURE cadastraFuncionario (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, empresa_ Tp_EmpresaTerceirizada) IS
        BEGIN
            INSERT INTO Tb_FuncionarioTerceirizado VALUES (
                Tp_FuncionarioTerceirizado(cpf_, nome_, Ar_Fone(telefone_), endereco_, Tp_Rel_Emite(), NULL)
            );
            INSERT INTO TABLE (SELECT e.trabalha FROM Tb_EmpresaTerceirizada e WHERE e.cod = empresa_.cod) VALUES (
                Tp_Ref_FuncionarioTerceirizado((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = cpf_))
            );
        END;
END;
/
