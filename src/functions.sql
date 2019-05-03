--Functions de Funcionario 
-- Ordenar por Salario 
ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION orderPorSalario RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    MEMBER FUNCTION orderPorSalario RETURN NUMBER IS
    BEGIN
        RETURN salario;
    END;
END;

-- OVERRIDING 
ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION calSalarioAnual RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    CONSTRUCTOR FUNCTION Tp_Funcionario (x Tp_FuncionarioEfetivo) RETURN NUMBER IS
   SELF AS RESULT IS 
    BEGIN
cpf:= x.cpf; nome:= x.nome; telefones := x.telefones; endereco := x.endereco; RETURN;  
    END;
OVERRIDING MEMBER FUNCTION salarioAnual RETURN NUMBER IS
BEGIN
    RETURN salario*12*1.1;
END;
    END;

-- AVG
ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION mediaSalarioFunc RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION mediaSalarioFunc RETURN NUMBER AS
x NUMBER;
     BEGIN
    SELECT AVG(fe.salario) into x FROM Tb_FuncionarioEfetivo fe;
    return x;
 END;

-- MAX 
ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION maiorSalarioFunc RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION maiorSalarioFunc 
    RETURN NUMBER 
AS
       x NUMBER;
    BEGIN
    SELECT MAX(salario) into x FROM Tb_FuncionarioEfetivo;
    RETURN x;
END;

-- MIN
ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION menorSalarioFunc RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION menorSalarioFunc 
       AS
       var x; 
    RETURN NUMBER 
    BEGIN
    SELECT MIN(salario) into x FROM Tb_FuncionarioEfetivo;
    return x;
    END;

--Having - Menor salario dos funcionarios do departamento 1 que ganham acima de 1500

ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION menorSalarioDep RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION menorSalarioDep
    (P_depto    number) 
       AS
    x NUMBER; 
    RETURN NUMBER 
    BEGIN
    SELECT MIN(salario) into x FROM Tb_FuncionarioEfetivo;
    WHERE cod = P_depto
    group by cod
    having min(salario) < 1500 ;
    return x;
    END;

-- COUNT 

ALTER TYPE Tp_Produto ADD MEMBER FUNCTION totalProduto RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION totalProduto  
RETURN NUMBER 
AS
       x NUMBER;   
BEGIN
    SELECT COUNT(id) into x FROM Tb_Produto;
    return x;
END;

-- BETWEEN TESTAR 

ALTER TYPE Tp_FuncionarioEfetivo ADD MEMBER FUNCTION funcInterSalario RETURN NUMBER CASCADE;

CREATE OR REPLACE FUNCTION funcInterSalario
RETURN NUMBER 
AS
       x NUMBER;   
BEGIN
    SELECT nome FROM Tb_FuncionarioEfetivo WHERE salario 
(SELECT FROM Tb_produto  WHERE salario BETWEEN 1000 AND 2000
    return x;
END;




--Functions Funcionario Tercerizado 
ALTER TYPE Tp_FuncionarioTercerizado ADD MEMBER FUNCTION orderPorContrato RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY Tp_FuncionarioEfetivo AS
    MEMBER FUNCTION orderPorContrato RETURN NUMBER IS
    BEGIN
        RETURN contrato;
    END;
END;



-- SELECTS
 -- SELECT mediaSalarioFunc() FROM Tb_FuncionarioEfetivo fe
 -- SELECT maiorSalarioFunc() From Tb_FuncionarioEfetivo; 

