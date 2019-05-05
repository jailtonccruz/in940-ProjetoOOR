ALTER TYPE Tp_FuncionarioTerceirizado
    ADD STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco, empresa_ Tp_EmpresaTerceirizada) RETURN Tp_FuncionarioTerceirizado
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_FuncionarioTerceirizado AS

    -- Cadastra novo funcionario e o relaciona a empresa recebida
    STATIC FUNCTION cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ Tp_Telefone, endereco_ Tp_Endereco, empresa_ Tp_EmpresaTerceirizada) RETURN Tp_FuncionarioTerceirizado IS
        funcionario_ Tp_FuncionarioTerceirizado := Tp_FuncionarioTerceirizado(cpf_, nome_, telefone_, endereco_,
                                                                              Tp_Rel_Emite(), cpf_);
        BEGIN
            INSERT INTO Tb_FuncionarioTerceirizado VALUES (funcionario_);
            INSERT INTO TABLE (SELECT e.trabalha FROM Tb_EmpresaTerceirizada e WHERE e.cod = empresa_.cod)
            VALUES (Tp_Ref_FuncionarioTerceirizado(
                    (SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = funcionario_.cpf))
                   );
            DBMS_OUTPUT.PUT_LINE(
                        'funcionario terceirizado => cpf: ' || funcionario_.cpf || ', nome: ' || funcionario_.nome
                );
            DBMS_OUTPUT.PUT_LINE('    relacionado a empresa: ' || empresa_.nome);
            RETURN funcionario_;
        END;

END;
/
