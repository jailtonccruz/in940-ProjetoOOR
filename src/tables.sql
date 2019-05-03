---- TABLES ----

CREATE TABLE Tb_EmpresaTerceirizada OF Tp_EmpresaTerceirizada NESTED TABLE trabalha STORE AS Nt_Trabalha;
ALTER TABLE Tb_EmpresaTerceirizada
    ADD PRIMARY KEY (cod);
ALTER TABLE Tb_EmpresaTerceirizada
    ADD CHECK (nome IS NOT NULL AND trabalha IS NOT NULL);


CREATE TABLE Tb_Departamento OF Tp_Departamento NESTED TABLE pertence STORE AS Nt_Pertence;
ALTER TABLE Tb_Departamento
    ADD PRIMARY KEY (cod);
ALTER TABLE Tb_Departamento
    ADD CHECK ( nome IS NOT NULL AND sigla IS NOT NULL and pertence IS NOT NULL );


CREATE TABLE Tb_Cliente of Tp_Cliente NESTED TABLE faz STORE AS Nt_Faz;
ALTER TABLE Tb_Cliente
    ADD PRIMARY KEY (cpf);
ALTER TABLE Tb_Cliente
    ADD CHECK ( nome IS NOT NULL AND telefones IS NOT NULL AND endereco IS NOT NULL AND faz IS NOT NULL );


CREATE TABLE Tb_FuncionarioEfetivo of Tp_FuncionarioEfetivo NESTED TABLE emite STORE AS Nt_Emite_FE;
ALTER TABLE Tb_FuncionarioEfetivo
    ADD PRIMARY KEY (cpf);
ALTER TABLE Tb_FuncionarioEfetivo
    ADD CHECK ( nome IS NOT NULL AND telefones IS NOT NULL AND endereco IS NOT NULL AND emite IS NOT NULL AND
                salario IS NOT NULL);


CREATE TABLE Tb_FuncionarioTerceirizado of Tp_FuncionarioTerceirizado NESTED TABLE emite STORE AS Nt_Emite_FT;
ALTER TABLE Tb_FuncionarioTerceirizado
    ADD PRIMARY KEY (cpf);
ALTER TABLE Tb_FuncionarioTerceirizado
    ADD CHECK ( nome IS NOT NULL AND telefones IS NOT NULL AND endereco IS NOT NULL AND emite IS NOT NULL);
ALTER TABLE Tb_FuncionarioTerceirizado
    ADD UNIQUE (contrato);


CREATE TABLE Tb_Pedido of Tp_Pedido;
ALTER TABLE Tb_Pedido
    ADD PRIMARY KEY (cod);
ALTER TABLE Tb_Pedido
    ADD CHECK ( data IS NOT NULL );


CREATE TABLE Tb_Produto of Tp_Produto;
ALTER TABLE Tb_Produto
    ADD PRIMARY KEY (cod);
ALTER TABLE Tb_Produto
    ADD CHECK (nome IS NOT NULL AND valor IS NOT NULL AND estoque IS NOT NULL AND limiarPedido IS NOT NULL);


CREATE TABLE Tb_Promocao of Tp_Promocao;
ALTER TABLE Tb_Promocao
    ADD CHECK (qtdMin IS NOT NULL AND desconto IS NOT NULL);


CREATE TABLE Tb_Sessao of Tp_Sessao NESTED TABLE contem STORE AS Nt_Contem;
ALTER TABLE Tb_Sessao
    ADD PRIMARY KEY (cod);



---- REL TABLES ----

CREATE TABLE Tb_Rel_Inclui OF Tp_Rel_Inclui;
ALTER TABLE Tb_Rel_Inclui
    ADD CHECK (pedido IS NOT NULL AND produto IS NOT NULL AND quantidade IS NOT NULL AND valor IS NOT NULL);


CREATE TABLE Tb_Rel_Movimenta OF Tp_Rel_Movimenta;
ALTER TABLE Tb_Rel_Movimenta
    ADD PRIMARY KEY (cod);
ALTER TABLE Tb_Rel_Movimenta
    ADD CHECK (data IS NOT NULL AND tipo IS NOT NULL AND quantidade IS NOT NULL);


---- DROPS ----

DROP TABLE Tb_EmpresaTerceirizada;
DROP TABLE Tb_Departamento;
DROP TABLE Tb_Cliente;
DROP TABLE Tb_FuncionarioEfetivo;
DROP TABLE Tb_FuncionarioTerceirizado;
DROP TABLE Tb_Pedido;
DROP TABLE Tb_Produto;
DROP TABLE Tb_Promocao;
DROP TABLE Tb_Sessao;
DROP TABLE Tb_Rel_Inclui;
DROP TABLE Tb_Rel_Movimenta;
