---- RELATIONSHIPS ----

-- 1 - 1 --

-- Possui => Promoção (1) - 1 Produto
ALTER TYPE Tp_Promocao ADD ATTRIBUTE (produto REF Tp_Produto) CASCADE;



-- 1 - N --

-- Trabalha => EmpresaTerceirizada 1 - (N) FuncionárioTerceirizado
CREATE OR REPLACE TYPE Tp_Ref_FuncionarioTerceirizado AS OBJECT
(
    funcionarioTerceirizado REF Tp_FuncionarioTerceirizado
) NOT FINAL;
/
CREATE OR REPLACE TYPE Tp_Rel_Trabalha AS TABLE OF Tp_Ref_FuncionarioTerceirizado;
/
ALTER TYPE Tp_EmpresaTerceirizada ADD ATTRIBUTE (trabalha Tp_Rel_Trabalha) CASCADE;


-- Pertence => Departamento 1 - (N) Funcionário
CREATE OR REPLACE TYPE Tp_Ref_Funcionario AS OBJECT
(
    funcionario REF Tp_Funcionario
) NOT FINAL;
/
CREATE OR REPLACE TYPE Tp_Rel_Pertence AS TABLE OF Tp_Ref_Funcionario;
/
ALTER TYPE Tp_Departamento ADD ATTRIBUTE (pertence Tp_Rel_Pertence) CASCADE;


-- Emite => Funcionário 1 - N Pedido
CREATE OR REPLACE TYPE Tp_Ref_Pedido AS OBJECT
(
    pedido REF Tp_Pedido
) NOT FINAL;
/
CREATE OR REPLACE TYPE Tp_Rel_Emite AS TABLE OF Tp_Ref_Pedido;
/
ALTER TYPE Tp_Funcionario ADD ATTRIBUTE (emite Tp_Rel_Emite) CASCADE;


-- Faz => Client 1 - (N) Pedido
-- CREATE OR REPLACE TYPE Tp_Ref_Pedido AS OBJECT
-- (
--     pedido REF Tp_Pedido
-- ) NOT FINAL;
-- /
CREATE OR REPLACE TYPE Tp_Rel_Faz AS TABLE OF Tp_Ref_Pedido;
/
ALTER TYPE Tp_Cliente ADD ATTRIBUTE (faz Tp_Rel_Faz) CASCADE;


-- Contem => Sessão 1 - N Produto
CREATE OR REPLACE TYPE Tp_Ref_Produto AS OBJECT
(
    produto REF Tp_Produto
) NOT FINAL;
/
CREATE OR REPLACE TYPE Tp_Rel_Contem AS TABLE OF Tp_Ref_Produto;
/
ALTER TYPE Tp_Sessao ADD ATTRIBUTE (contem Tp_Rel_Contem) CASCADE;



-- N x N --

-- Inclui => Pedido N - N Produto
CREATE OR REPLACE TYPE Tp_Rel_Inclui AS OBJECT
(
    pedido     REF Tp_Pedido,
    produto    Ref Tp_Produto,
    quantidade NUMBER,
    valor      NUMBER
);
/


-- Movimenta => FuncionárioEfetivo N - N Produto
CREATE OR REPLACE TYPE Tp_Rel_Movimenta AS OBJECT
(
    funcionario REF Tp_FuncionarioEfetivo,
    produto     REF Tp_Produto,
    cod         NUMBER,
    data        DATE,
    quantidade  NUMBER
    tipo        CHAR(1)
);
/


---- DROPS ----

DROP TYPE Tp_Ref_FuncionarioTerceirizado FORCE;
DROP TYPE Tp_Rel_Trabalha FORCE;
DROP TYPE Tp_Ref_Funcionario FORCE;
DROP TYPE Tp_Rel_Pertence FORCE;
DROP TYPE Tp_Ref_Pedido FORCE;
DROP TYPE Tp_Rel_Emite FORCE;
DROP TYPE Tp_Rel_Faz FORCE;
DROP TYPE Tp_Ref_Produto FORCE;
DROP TYPE Tp_Rel_Contem FORCE;
DROP TYPE Tp_Rel_Movimenta FORCE;
