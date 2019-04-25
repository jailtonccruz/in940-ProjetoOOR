ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION orderPorSalario RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    MEMBER FUNCTION orderPorSalario RETURN NUMBER IS
    BEGIN
        RETURN salario;
    END;
END;
/



-- INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (TP_FUNCIONARIOEFETIVO(123, 'NOME', AR_FONE(), TP_ENDERECO('', '', '', 'as'), TP_REL_EMITE(), 2222));
-- select fe.orderPorSalario() from Tb_FuncionarioEfetivo fe

