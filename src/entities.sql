---- TYPES ----

-- Empresa Terceirizada
CREATE OR REPLACE TYPE Tp_EmpresaTerceirizada AS OBJECT
(
    id   NUMBER,
    nome VARCHAR2(255)
);
/

-- Departamento
CREATE OR REPLACE TYPE Tp_Departamento AS OBJECT
(
    id    NUMBER,
    nome  VARCHAR2(255),
    sigla VARCHAR2(255)
);
/

-- Pessoa
CREATE OR REPLACE TYPE Tp_Endereco AS OBJECT
(
    logradouro VARCHAR2(255),
    bairro     VARCHAR2(255),
    cidade     VARCHAR2(255),
    uf         CHAR(2)
);
/

CREATE OR REPLACE TYPE Ar_Fone IS VARRAY (10) OF NUMBER(11);
/

CREATE OR REPLACE TYPE Tp_Pessoa AS OBJECT
(
    cpf      NUMBER(11),
    nome     VARCHAR2(255),
    foneNums Ar_fone,
    endereco Tp_Endereco
) NOT FINAL;
/

-- Funcionário
CREATE OR REPLACE TYPE Tp_Funcionario UNDER Tp_Pessoa
(
) NOT FINAL;
/

-- Cliente
CREATE OR REPLACE TYPE Tp_Cliente UNDER Tp_Pessoa
(
);
/

-- Funcionário Efetivo
CREATE OR REPLACE TYPE Tp_FuncionarioEfetivo UNDER Tp_Funcionario
(
    salario NUMBER(9, 2)
);
/

-- Funcionário Terceirizado
CREATE OR REPLACE TYPE Tp_FuncionarioTerceirizado UNDER Tp_Funcionario
(
    contrato NUMBER
);
/

-- Pedido
CREATE OR REPLACE TYPE Tp_Pedido AS OBJECT
(
    id   NUMBER,
    data DATE
);
/

-- Promoção
CREATE OR REPLACE TYPE Tp_Promocao AS OBJECT
(
    qtdMin   NUMBER,
    desconto NUMBER
);
/

-- Produto
CREATE OR REPLACE TYPE Tp_Produto AS OBJECT
(
    id           NUMBER,
    nome         VARCHAR2(255),
    valor        NUMBER,
    estoque      NUMBER,
    limiarPedido NUMBER
);
/

-- Sessão
CREATE OR REPLACE TYPE Tp_Sessao AS OBJECT
(
    id   NUMBER,
    nome VARCHAR2(255)
);
/


---- DROPS ----

DROP TYPE Tp_EmpresaTerceirizada FORCE;
DROP TYPE Tp_Departamento FORCE;
DROP TYPE Tp_Endereco FORCE;
DROP TYPE Ar_Fone FORCE;
DROP TYPE Tp_Pessoa FORCE;
DROP TYPE Tp_Funcionario FORCE;
DROP TYPE Tp_Cliente FORCE;
DROP TYPE Tp_FuncionarioEfetivo FORCE;
DROP TYPE Tp_FuncionarioTerceirizado FORCE;
DROP TYPE Tp_Pedido FORCE;
DROP TYPE Tp_Promocao FORCE;
DROP TYPE Tp_Produto FORCE;
DROP TYPE Tp_Sessao FORCE;
