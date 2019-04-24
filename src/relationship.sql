-- 1 - 1 --


-- Possui => Promoção (1) - 1 Produto
ALTER TYPE Tp_Promocao ADD ATTRIBUTE (produto REF Tp_Produto);



-- 1 - N --


-- Trabalha => EmpresaTerceirizada 1 - (N) Funcionário Terceirizado
DROP TYPE Tp_Ref_FuncionarioTerceirizado FORCE;
CREATE OR REPLACE TYPE Tp_Ref_FuncionarioTerceirizado AS OBJECT
(
    funcionarioTerceirizado REF Tp_FuncionarioTerceirizado
) NOT FINAL;
/
DROP TYPE Tp_Rel_Trabalha FORCE;
CREATE OR REPLACE TYPE Tp_Rel_Trabalha AS TABLE OF Tp_Ref_FuncionarioTerceirizado;
/
ALTER TYPE Tp_EmpresaTerceirizada ADD ATTRIBUTE (trabalha Tp_Rel_Trabalha);


-- Pertence => Departamento 1 - (N) Funcionário
DROP TYPE Tp_Ref_Funcionario FORCE;
CREATE OR REPLACE TYPE Tp_Ref_Funcionario AS OBJECT
(
    funcionario REF Tp_Funcionario
) NOT FINAL;
/
DROP TYPE Tp_Rel_Pertence FORCE;
CREATE OR REPLACE TYPE Tp_Rel_Pertence AS TABLE OF Tp_Ref_Funcionario;
/
ALTER TYPE Tp_Departamento ADD ATTRIBUTE (pertence Tp_Rel_Pertence);


-- Emite => Funcionário 1 - N Pedido
DROP TYPE Tp_Ref_Pedido FORCE;
CREATE OR REPLACE TYPE Tp_Ref_Pedido AS OBJECT
(
    pedido REF Tp_Pedido
) NOT FINAL;
/
DROP TYPE Tp_Rel_Emite FORCE;
CREATE OR REPLACE TYPE Tp_Rel_Emite AS TABLE OF Tp_Ref_Pedido;
/
ALTER TYPE Tp_Funcionario ADD ATTRIBUTE (emite Tp_Rel_Emite);


-- Faz => Client 1 - (N) Pedido
-- DROP TYPE Tp_Ref_Pedido FORCE;
-- CREATE OR REPLACE TYPE Tp_Ref_Pedido AS OBJECT
-- (
--     pedido REF Tp_Pedido
-- ) NOT FINAL;
-- /
DROP TYPE Tp_Rel_Faz FORCE;
CREATE OR REPLACE TYPE Tp_Rel_Faz AS TABLE OF Tp_Ref_Pedido;
/
ALTER TYPE Tp_Cliente ADD ATTRIBUTE (faz Tp_Rel_Faz);


-- Contem => Sessão 1 - N Produto
DROP TYPE Tp_Ref_Produto FORCE;
CREATE OR REPLACE TYPE Tp_Ref_Produto AS OBJECT
(
    produto REF Tp_Produto
) NOT FINAL;
/
DROP TYPE Tp_Rel_Contem FORCE;
CREATE OR REPLACE TYPE Tp_Rel_Contem AS TABLE OF Tp_Ref_Produto;
/
ALTER TYPE Tp_Sessao ADD ATTRIBUTE (contem Tp_Rel_Contem);



-- N x N --

-- Faltando