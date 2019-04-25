-- sequences
CREATE SEQUENCE seq start with 0 minivalue 0;



-- inserting clients
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'NOME DE ALGUÉM', NULL, NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'Thayonara', ar_fone(819777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'Elisa', ar_fone(83928192), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'Jailton', ar_fone(82997777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'Pedro', ar_fone(81997777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'Karine', ar_fone(819977161), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'OutroSerHumano', ar_fone(819977161), tp_endereco('rua1','bairro1','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'cli1', ar_fone(81123), tp_endereco('rua1','bairro1','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'cli2', ar_fone(811231), tp_endereco('rua2','bairro2','cidade2', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'cli1', ar_fone(81122), tp_endereco('rua3','bairro2','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(seq.nextval, 'cli1', ar_fone(81124), tp_endereco('rua4','bairro1','cidade1', 'PE'), tp_rel_faz())); 

--func efetivo
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Guilherme', ar_fone(01), Tp_Endereco('Rua 1', 'Arruda', 'Recife', 'PE'), TP_REL_EMITE(), 2000));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Lucas', ar_fone(02), Tp_Endereco('Rua 2', 'Boa Viagem', 'Recife', 'PE'), TP_REL_EMITE(), 2100));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Ana', ar_fone(03), Tp_Endereco('Rua 3', 'Várzea', 'Recife', 'PE'), TP_REL_EMITE(), 2200));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Márcia', ar_fone(04), Tp_Endereco('Rua 4', 'Espinheiros', 'Recife', 'PE'), TP_REL_EMITE() , 2300));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Dalva', ar_fone(05), Tp_Endereco('Rua 5', 'Aflitos', 'Recife', 'PE'), TP_REL_EMITE(), 2400));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Jean', ar_fone(06), Tp_Endereco('Rua 6', 'Setúbal', 'Recife', 'PE'), TP_REL_EMITE(), 2500));


-- inserting func terc
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT2', ar_fone(1232), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 2));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT1', ar_fone(1231), Tp_Endereco('rua1','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 1));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT1', ar_fone(1233), Tp_Endereco('rua3','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 3));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT2', ar_fone(1234), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 4));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT3', ar_fone(1235), Tp_Endereco('rua3','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 5));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT4', ar_fone(1236), Tp_Endereco('rua5','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 6));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT2', ar_fone(1237), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 7));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT1', ar_fone(1238), Tp_Endereco('rua5','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 8));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT1', ar_fone(1239), Tp_Endereco('rua4','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 9));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'FuncT2', ar_fone(12310), Tp_Endereco('rua3', 'bairro2','cidade1', 'PE'), TP_REL_EMITE(), 10));

-- inserting promocao
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 20, (select REF(p) from tb_produto p where p.id = 1)));
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 10, (select REF(p) from tb_produto p where p.id = 2)));
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 30, (select REF(p) from tb_produto p where p.id = 3)));


-- inserting produtos
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Sabonete', 2, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Arroz', 4, 4000, 800));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Chocolate', 2, 2000, 400));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Cotonete', 6, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Panela', 34, 500, 100));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Ralador', 14, 300, 75));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Alicate', 9, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Tablet', 600, 300, 75));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(seq.nextval, 'Notebook', 1550, 500, 100));

