
DROP TABLE Tb_EmpresaTerceirizada;
CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada
(
    CONSTRAINT Pk_EmpresaTerceirizada PRIMARY KEY (Id)
);
DROP TABLE Tb_Departamento;
CREATE TABLE Tb_Departamento OF Tp_Departamento
(
    CONSTRAINT Pk_Departamento PRIMARY KEY (id)
);

DROP TABLE Tb_Cliente;

CREATE TABLE Tb_Cliente of Tp_Cliente
(
    CONSTRAINT pk_Cliente PRIMARY KEY (cpf)--,
    --    constraint fk_cliente_pessoa foreign key (cpf) references tp_pessoa(cpf)
);

DROP TABLE Tb_FuncionarioEfetivo;
CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo
(
    CONSTRAINT Pk_FuncionarioEfetivo PRIMARY KEY (cpf)
);

DROP TABLE Tb_FuncionarioTerceirizado;


CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado
(CONSTRAINT Pk_FuncionarioTerceirizado PRIMARY KEY (cpf),
CONSTRAINT Fk_FunTerceirizado_Empresa (IdEmpresaTerc)
FOREIGN KEY Tb_EmpresaTerceirizada (Id)
);

DROP TABLE Tb_Pedido;

CREATE TABLE Tb_Pedido of Tp_Pedido
(
    CONSTRAINT Pk_Pedido PRIMARY KEY (id)
);
DROP TABLE Tb_Promocao;
CREATE TABLE Tb_Promocao of Tp_Promocao;

DROP TABLE Tb_Produto;
CREATE TABLE Tb_Produto of Tp_Produto
(
    CONSTRAINT pk_Produto PRIMARY KEY (id)
);
DROP TABLE Tb_Sessao;
CREATE TABLE Tb_Sessao of Tp_Sessao
(
    CONSTRAINT pk_sessao PRIMARY KEY (id)
);
CREATE TABLE Tb_Movimento of Tp_Movimento
(
    CONSTRAINT pk_Movimento PRIMARY KEY (id)
);


CREATE TABLE Tb_Rel_Contem of Tp_Rel_Contem

CREATE TABLE Tb_Rel_Movimenta OF Tp_Rel_Movimenta
