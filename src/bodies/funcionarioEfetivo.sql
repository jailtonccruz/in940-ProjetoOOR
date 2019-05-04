ALTER TYPE Tp_FuncionarioEfetivo
    ADD STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, salario_ NUMBER),
    ADD MEMBER FUNCTION orderPorSalario RETURN NUMBER,
    ADD MEMBER FUNCTION funcMes (mes NUMBER ) RETURN NUMBER
    CASCADE;
/

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS


    -- Cadastra um novo funcionario.
    STATIC PROCEDURE cadastra (cpf_ NUMBER, nome_ VARCHAR2, telefone_ NUMBER, endereco_ Tp_Endereco, salario_ NUMBER) IS
        BEGIN
            INSERT INTO Tb_FuncionarioEfetivo
            VALUES (
                       Tp_FuncionarioEfetivo(cpf_, nome_, Ar_Fone(telefone_), endereco_, Tp_Rel_Emite(), salario_)
                   );
        END;


    MEMBER FUNCTION orderPorSalario RETURN NUMBER IS
        BEGIN
            RETURN salario;
        END;


    MEMBER FUNCTION funcMes (mes NUMBER ) RETURN NUMBER IS
        BEGIN
            RETURN (SELECT count(PEDIDO) from TB_FUNCIONARIOEFETIVO where MONTH(PEDIDO.date) = mes);
        END;
END;
/

