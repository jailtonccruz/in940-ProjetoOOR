-- inserting clients
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(0893832, 'NOME DE ALGUÉM', NULL, NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(123456, 'Thayonara', ar_fone(819777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(123123, 'Elisa', ar_fone(83928192), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(321321, 'Jailton', ar_fone(82997777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(123412, 'Pedro', ar_fone(81997777), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(1234561, 'Karine', ar_fone(819977161), NULL, tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(123412312, 'OutroSerHumano', ar_fone(819977161), tp_endereco('rua1','bairro1','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(1, 'cli1', ar_fone(81123), tp_endereco('rua1','bairro1','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(2, 'cli2', ar_fone(811231), tp_endereco('rua2','bairro2','cidade2', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(3, 'cli1', ar_fone(81122), tp_endereco('rua3','bairro2','cidade1', 'PE'), tp_rel_faz())); 
INSERT INTO TB_CLIENTE VALUES (TP_CLIENTE(4, 'cli1', ar_fone(81124), tp_endereco('rua4','bairro1','cidade1', 'PE'), tp_rel_faz())); 

--func efetivo
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(1, 'Guilherme', ar_fone(01), Tp_Endereco('Rua 1', 'Arruda', 'Recife', 'PE'), TP_REL_EMITE(), 2000));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(2, 'Lucas', ar_fone(02), Tp_Endereco('Rua 2', 'Boa Viagem', 'Recife', 'PE'), TP_REL_EMITE(), 2100));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(3, 'Ana', ar_fone(03), Tp_Endereco('Rua 3', 'Várzea', 'Recife', 'PE'), TP_REL_EMITE(), 2200));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(4, 'Márcia', ar_fone(04), Tp_Endereco('Rua 4', 'Espinheiros', 'Recife', 'PE'), TP_REL_EMITE() , 2300));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(5, 'Dalva', ar_fone(05), Tp_Endereco('Rua 5', 'Aflitos', 'Recife', 'PE'), TP_REL_EMITE(), 2400));
INSERT INTO TB_FUNCIONARIOEFETIVO VALUES (Tp_FuncionarioEfetivo(6, 'Jean', ar_fone(06), Tp_Endereco('Rua 6', 'Setúbal', 'Recife', 'PE'), TP_REL_EMITE(), 2500));


-- inserting func terc
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(2, 'FuncT2', ar_fone(1232), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 2));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(1, 'FuncT1', ar_fone(1231), Tp_Endereco('rua1','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 1));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(3, 'FuncT1', ar_fone(1233), Tp_Endereco('rua3','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 3));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(4, 'FuncT2', ar_fone(1234), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 4));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(5, 'FuncT3', ar_fone(1235), Tp_Endereco('rua3','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 5));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(6, 'FuncT4', ar_fone(1236), Tp_Endereco('rua5','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 6));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(7, 'FuncT2', ar_fone(1237), Tp_Endereco('rua2','bairro2','cidade1', 'PE'), TP_REL_EMITE(), 7));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(8, 'FuncT1', ar_fone(1238), Tp_Endereco('rua5','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 8));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(9, 'FuncT1', ar_fone(1239), Tp_Endereco('rua4','bairro1','cidade1', 'PE'), TP_REL_EMITE(), 9));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(10, 'FuncT2', ar_fone(12310), Tp_Endereco('rua3', 'bairro2','cidade1', 'PE'), TP_REL_EMITE(), 10));

-- inserting promocao
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 20, (select REF(p) from tb_produto p where p.id = 1)));
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 10, (select REF(p) from tb_produto p where p.id = 2)));
INSERT INTO TB_PROMOCAO VALUES (TP_PROMOCAO(200, 30, (select REF(p) from tb_produto p where p.id = 3)));


-- inserting produtos
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(1, 'Sabonete', 2, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(2, 'Arroz', 4, 4000, 800));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(3, 'Chocolate', 2, 2000, 400));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(4, 'Cotonete', 6, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(5, 'Panela', 34, 500, 100));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(6, 'Ralador', 14, 300, 75));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(7, 'Alicate', 9, 1000, 200));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(8, 'Tablet', 600, 300, 75));
INSERT INTO TB_PRODUTO VALUES (TP_PRODUTO(9, 'Notebook', 1550, 500, 100));

