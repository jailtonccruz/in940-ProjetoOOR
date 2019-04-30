ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION orderPorSalario RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    MEMBER FUNCTION orderPorSalario RETURN NUMBER IS
    BEGIN
        RETURN (salario);
    END;
END;
/
