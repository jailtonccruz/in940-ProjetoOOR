---- TYPES ----

-- Departamento
CREATE OR REPLACE TYPE Tp_Departamento AS OBJECT
(
    cod   NUMBER,
    nome  VARCHAR2(255),
    sigla VARCHAR2(255)
);
/

-- Empresa Terceirizada
CREATE OR REPLACE TYPE Tp_EmpresaTerceirizada AS OBJECT
(
    cod  NUMBER,
    nome VARCHAR2(255)
);
/

-- Pessoa
CREATE OR REPLACE TYPE Tp_Telefone AS OBJECT
(
    ddd NUMBER(2),
    num NUMBER(9)
);

CREATE OR REPLACE TYPE Tp_Endereco AS OBJECT
(
    logradouro VARCHAR2(255),
    cidade     VARCHAR2(255)
);
/


CREATE OR REPLACE TYPE Tp_Pessoa AS OBJECT
(
    cpf      NUMBER(11),
    nome     VARCHAR2(255),
    telefone Tp_Telefone,
    endereco Tp_Endereco
) NOT FINAL NOT INSTANTIABLE;
/

-- Funcionário
CREATE OR REPLACE TYPE Tp_Funcionario UNDER Tp_Pessoa
(
) NOT FINAL NOT INSTANTIABLE;
/

-- Cliente
CREATE OR REPLACE TYPE Tp_Cliente UNDER Tp_Pessoa
(
);
/

-- Funcionário Efetivo
CREATE OR REPLACE TYPE Tp_FuncionarioEfetivo UNDER Tp_Funcionario
(
    salario NUMBER
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
    cod  NUMBER,
    data DATE
);
/

-- Produto
CREATE OR REPLACE TYPE Tp_Produto AS OBJECT
(
    cod          NUMBER,
    nome         VARCHAR2(255),
    valor        NUMBER,
    estoque      NUMBER,
    limiarPedido NUMBER
);
/

-- Promoção
CREATE OR REPLACE TYPE Tp_Promocao AS OBJECT
(
    cod        NUMBER,
    quantidade NUMBER,
    desconto   NUMBER,
    de         DATE,
    ate        DATE
);
/

-- Sessão
CREATE OR REPLACE TYPE Tp_Sessao AS OBJECT
(
    cod  NUMBER,
    nome VARCHAR2(255)
);
/


---- VARRAY ARGS FOR FUNCTIONS AND PROCEDURES ----

CREATE TYPE Ar_Number IS VARRAY (9999) OF NUMBER;
CREATE TYPE Ar_Departamento IS VARRAY (9999) OF Tp_Departamento;
CREATE TYPE Ar_EmpresaTerceirizada IS VARRAY (9999) OF Tp_EmpresaTerceirizada;
CREATE TYPE Ar_Pessoa IS VARRAY (9999) OF Tp_Pessoa;
CREATE TYPE Ar_Funcionario IS VARRAY (9999) OF Tp_Funcionario;
CREATE TYPE Ar_Cliente IS VARRAY (9999) OF Tp_Cliente;
CREATE TYPE Ar_FuncionarioEfetivo IS VARRAY (9999) OF Tp_FuncionarioEfetivo;
CREATE TYPE Ar_FuncionarioTerceirizado IS VARRAY (9999) OF Tp_FuncionarioTerceirizado;
CREATE TYPE Ar_Pedido IS VARRAY (9999) OF Tp_Pedido;
CREATE TYPE Ar_Produto IS VARRAY (9999) OF Tp_Produto;
CREATE TYPE Ar_Promocao IS VARRAY (9999) OF Tp_Promocao;
CREATE TYPE Ar_Sessao IS VARRAY (9999) OF Tp_Sessao;


---- DROPS ----

DROP TYPE Tp_Departamento FORCE;
DROP TYPE Tp_EmpresaTerceirizada FORCE;
DROP TYPE Tp_Telefone FORCE;
DROP TYPE Tp_Endereco FORCE;
DROP TYPE Tp_Pessoa FORCE;
DROP TYPE Tp_Funcionario FORCE;
DROP TYPE Tp_Cliente FORCE;
DROP TYPE Tp_FuncionarioEfetivo FORCE;
DROP TYPE Tp_FuncionarioTerceirizado FORCE;
DROP TYPE Tp_Pedido FORCE;
DROP TYPE Tp_Produto FORCE;
DROP TYPE Tp_Promocao FORCE;
DROP TYPE Tp_Sessao FORCE;

DROP TYPE Ar_Number FORCE;
DROP TYPE Ar_Departamento FORCE;
DROP TYPE Ar_EmpresaTerceirizada FORCE;
DROP TYPE Ar_Pessoa FORCE;
DROP TYPE Ar_Funcionario FORCE;
DROP TYPE Ar_Cliente FORCE;
DROP TYPE Ar_FuncionarioEfetivo FORCE;
DROP TYPE Ar_FuncionarioTerceirizado FORCE;
DROP TYPE Ar_Pedido FORCE;
DROP TYPE Ar_Produto FORCE;
DROP TYPE Ar_Promocao FORCE;
DROP TYPE Ar_Sessao FORCE;
