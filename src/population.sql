-- sequences
CREATE SEQUENCE seq START WITH 0 MINVALUE 0;

-- inserting clients
INSERT INTO Tb_Cliente VALUES (Tp_Cliente(seq.nextval, 'Cliente 0', Ar_Fone(81000000000), Tp_Endereco('Rua 0', 'Bairro 0', 'Cidade 0', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente(seq.nextval, 'Cliente 1', Ar_Fone(81000000001), Tp_Endereco('Rua 1', 'Bairro 1', 'Cidade 1', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente(seq.nextval, 'Cliente 2', Ar_Fone(81000000002), Tp_Endereco('Rua 2', 'Bairro 2', 'Cidade 2', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente(seq.nextval, 'Cliente 3', Ar_Fone(81000000003), Tp_Endereco('Rua 3', 'Bairro 3', 'Cidade 3', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente(seq.nextval, 'Cliente 4', Ar_Fone(81000000004), Tp_Endereco('Rua 4', 'Bairro 4', 'Cidade 4', 'E0'), Tp_Rel_Faz()));

INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Funcionario Efetivo 0', Ar_Fone(81100000000), Tp_Endereco('Rua 10', 'Bairro 10', 'Cidade 10', 'E2'), Tp_Rel_Emite(), 100000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Funcionario Efetivo 1', Ar_Fone(81100000001), Tp_Endereco('Rua 11', 'Bairro 11', 'Cidade 11', 'E2'), Tp_Rel_Emite(), 101000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Funcionario Efetivo 2', Ar_Fone(81100000002), Tp_Endereco('Rua 12', 'Bairro 12', 'Cidade 12', 'E2'), Tp_Rel_Emite(), 102000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Funcionario Efetivo 3', Ar_Fone(81100000003), Tp_Endereco('Rua 13', 'Bairro 13', 'Cidade 13', 'E2'), Tp_Rel_Emite(), 103000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(seq.nextval, 'Funcionario Efetivo 4', Ar_Fone(81100000004), Tp_Endereco('Rua 14', 'Bairro 14', 'Cidade 14', 'E2'), Tp_Rel_Emite(), 104000));

INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'Funcionario Terceirizado 0', Ar_Fone(81200000000), Tp_Endereco('Rua 20', 'Bairro 20', 'Cidade 20', 'E3'), Tp_Rel_Emite(), 0));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'Funcionario Terceirizado 1', Ar_Fone(81200000001), Tp_Endereco('Rua 21', 'Bairro 21', 'Cidade 21', 'E3'), Tp_Rel_Emite(), 1));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'Funcionario Terceirizado 2', Ar_Fone(81200000002), Tp_Endereco('Rua 22', 'Bairro 22', 'Cidade 22', 'E3'), Tp_Rel_Emite(), 2));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'Funcionario Terceirizado 3', Ar_Fone(81200000003), Tp_Endereco('Rua 23', 'Bairro 23', 'Cidade 23', 'E3'), Tp_Rel_Emite(), 3));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(seq.nextval, 'Funcionario Terceirizado 4', Ar_Fone(81200000004), Tp_Endereco('Rua 24', 'Bairro 24', 'Cidade 24', 'E3'), Tp_Rel_Emite(), 4));

INSERT INTO Tb_EmpresaTerceirizada VALUES (
        Tp_EmpresaTerceirizada(
                seq.nextval,
                'Empresa Terceirizada 0',
                Tp_Rel_Trabalha(
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.nome = 'Funcionario Terceirizado 0')),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.nome = 'Funcionario Terceirizado 1')),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.nome = 'Funcionario Terceirizado 2'))
                )
        )
);
INSERT INTO Tb_EmpresaTerceirizada VALUES (
        Tp_EmpresaTerceirizada(
                seq.nextval,
                'Empresa Terceirizada 1',
                Tp_Rel_Trabalha(
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.nome = 'Funcionario Terceirizado 3')),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.nome = 'Funcionario Terceirizado 4'))
                )
        )
);

INSERT INTO Tb_Departamento VALUES (
        Tp_Departamento(
                seq.nextval,
                'Departamento 0',
                'Dp0',
                Tp_Rel_Pertence(
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 0')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 1')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 2')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 0')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 1'))
                )
        )
);
INSERT INTO Tb_Departamento VALUES (
        Tp_Departamento(
                seq.nextval,
                'Departamento 1',
                'Dp1',
                Tp_Rel_Pertence(
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 3')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 4')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 2')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 3')),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 4'))
                )
        )
);

INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 0', 0.50, 1000, 200));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 1', 1.50, 1001, 201));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 2', 2.50, 1002, 202));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 3', 3.50, 1003, 203));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 4', 4.50, 1004, 204));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 5', 5.50, 1005, 205));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 6', 6.50, 1006, 206));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 7', 7.50, 1007, 207));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 8', 8.50, 1008, 208));
INSERT INTO Tb_Produto VALUES (Tp_Produto(seq.nextval, 'Produto 9', 9.50, 1009, 209));

INSERT INTO Tb_Sessao VALUES (
        Tp_Sessao(
                seq.nextval,
                'Sessao 0',
                Tp_Rel_Contem(
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 0')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 1')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 2')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 3')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 4'))
                )
        )
);
INSERT INTO Tb_Sessao VALUES (
        Tp_Sessao(
                seq.nextval,
                'Sessao 1',
                Tp_Rel_Contem(
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 5')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 6')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 7')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 8')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 9'))
                )
        )
);


INSERT INTO Tb_Pedido VALUES (seq.nextval, '01-JAN-2018');
INSERT INTO Tb_Pedido VALUES (seq.nextval, '01-FEB-2018');
INSERT INTO Tb_Pedido VALUES (seq.nextval, '01-MAR-2018');
INSERT INTO Tb_Pedido VALUES (seq.nextval, '01-APR-2018');
INSERT INTO Tb_Pedido VALUES (seq.nextval, '01-MAY-2018');

INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-JAN-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 0'),
        10,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 0')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-JAN-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 1'),
        11,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 1')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-FEB-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 2'),
        20,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 2')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-FEB-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 3'),
        21,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 3')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAR-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 4'),
        30,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 4')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAR-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 5'),
        31,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 5')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-APR-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 6'),
        40,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 6')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-APR-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 7'),
        41,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 7')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAY-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 8'),
        50,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 8')
);
INSERT INTO Tb_Rel_Inclui VALUES (
        (SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAY-2018'),
        (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 9'),
        51,
        (SELECT p.valor FROM Tb_Produto p WHERE p.nome = 'Produto 9')
);

INSERT INTO TABLE (
        SELECT f.emite FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 0'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-JAN-2018'))
);
INSERT INTO TABLE (
        SELECT f.emite FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 1'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-FEB-2018'))
);
INSERT INTO TABLE (
        SELECT f.emite FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 2'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAR-2018'))
);
INSERT INTO TABLE (
        SELECT f.emite FROM Tb_FuncionarioTerceirizado f WHERE f.nome = 'Funcionario Terceirizado 3'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-APR-2018'))
);
INSERT INTO TABLE (
        SELECT f.emite FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 4'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAY-2018'))
);

INSERT INTO TABLE (
        SELECT c.faz FROM Tb_Cliente c WHERE c.nome = 'Cliente 0'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-JAN-2018'))
);
INSERT INTO TABLE (
        SELECT c.faz FROM Tb_Cliente c WHERE c.nome = 'Cliente 1'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-FEB-2018'))
);
INSERT INTO TABLE (
        SELECT c.faz FROM Tb_Cliente c WHERE c.nome = 'Cliente 2'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAR-2018'))
);
INSERT INTO TABLE (
        SELECT c.faz FROM Tb_Cliente c WHERE c.nome = 'Cliente 3'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-APR-2018'))
);
INSERT INTO TABLE (
        SELECT c.faz FROM Tb_Cliente c WHERE c.nome = 'Cliente 4'
) VALUES (
        Tp_Ref_Pedido((SELECT REF(p) FROM Tb_Pedido p WHERE p.data = '01-MAY-2018'))
);


INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 0'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 0'),
                seq.nextval,
                '02-JAN-2018',
                'e',
                100
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 1'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 1'),
                seq.nextval,
                '02-FEB-2018',
                'e',
                101
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 2'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 2'),
                seq.nextval,
                '02-MAR-2018',
                'e',
                102
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 3'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 3'),
                seq.nextval,
                '02-APR-2018',
                'e',
                103
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 4'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 4'),
                seq.nextval,
                '02-MAY-2018',
                'e',
                104
        )
);
