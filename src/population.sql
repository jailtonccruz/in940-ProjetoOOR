
-- inserting clients
INSERT INTO Tb_Cliente VALUES (Tp_Cliente (07671368458, 'Cliente 0', Ar_Fone(81000000000), Tp_Endereco('Rua 0', 'Bairro 0', 'Cidade 0', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente (05842364417, 'Cliente 1', Ar_Fone(81000000001), Tp_Endereco('Rua 1', 'Bairro 1', 'Cidade 1', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente (07673414490, 'Cliente 2', Ar_Fone(81000000002), Tp_Endereco('Rua 2', 'Bairro 2', 'Cidade 2', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente (09099983450, 'Cliente 3', Ar_Fone(81000000003), Tp_Endereco('Rua 3', 'Bairro 3', 'Cidade 3', 'E0'), Tp_Rel_Faz()));
INSERT INTO Tb_Cliente VALUES (Tp_Cliente (09190535496, 'Cliente 4', Ar_Fone(81000000004), Tp_Endereco('Rua 4', 'Bairro 4', 'Cidade 4', 'E0'), Tp_Rel_Faz()));

INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(07526066462, 'Funcionario Efetivo 0', Ar_Fone(81100000000), Tp_Endereco('Rua 10', 'Bairro 10', 'Cidade 10', 'E2'), Tp_Rel_Emite(), 100000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(10712130403, 'Funcionario Efetivo 1', Ar_Fone(81100000001), Tp_Endereco('Rua 11', 'Bairro 11', 'Cidade 11', 'E2'), Tp_Rel_Emite(), 101000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(04242732414, 'Funcionario Efetivo 2', Ar_Fone(81100000002), Tp_Endereco('Rua 12', 'Bairro 12', 'Cidade 12', 'E2'), Tp_Rel_Emite(), 102000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(08244993448, 'Funcionario Efetivo 3', Ar_Fone(81100000003), Tp_Endereco('Rua 13', 'Bairro 13', 'Cidade 13', 'E2'), Tp_Rel_Emite(), 103000));
INSERT INTO Tb_FuncionarioEfetivo VALUES (Tp_FuncionarioEfetivo(07598759448, 'Funcionario Efetivo 4', Ar_Fone(81100000004), Tp_Endereco('Rua 14', 'Bairro 14', 'Cidade 14', 'E2'), Tp_Rel_Emite(), 104000));

INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(03406454402, 'Funcionario Terceirizado 0', Ar_Fone(81200000000), Tp_Endereco('Rua 20', 'Bairro 20', 'Cidade 20', 'E3'), Tp_Rel_Emite(), 0));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(05947772400, 'Funcionario Terceirizado 1', Ar_Fone(81200000001), Tp_Endereco('Rua 21', 'Bairro 21', 'Cidade 21', 'E3'), Tp_Rel_Emite(), 1));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(06119597476, 'Funcionario Terceirizado 2', Ar_Fone(81200000002), Tp_Endereco('Rua 22', 'Bairro 22', 'Cidade 22', 'E3'), Tp_Rel_Emite(), 2));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(02791142495, 'Funcionario Terceirizado 3', Ar_Fone(81200000003), Tp_Endereco('Rua 23', 'Bairro 23', 'Cidade 23', 'E3'), Tp_Rel_Emite(), 3));
INSERT INTO Tb_FuncionarioTerceirizado VALUES (Tp_FuncionarioTerceirizado(03862926478, 'Funcionario Terceirizado 4', Ar_Fone(81200000004), Tp_Endereco('Rua 24', 'Bairro 24', 'Cidade 24', 'E3'), Tp_Rel_Emite(), 4));

INSERT INTO Tb_EmpresaTerceirizada VALUES (
        Tp_EmpresaTerceirizada(
                Sq_EmpresaTerceirizada.NEXTVAL,
                'Empresa Terceirizada 0',
                Tp_Rel_Trabalha(
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.cpf = 03406454402)),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.cpf = 06119597476)),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.cpf = 03862926478))
                )
        )
);
INSERT INTO Tb_EmpresaTerceirizada VALUES (
        Tp_EmpresaTerceirizada(
                Sq_EmpresaTerceirizada.NEXTVAL,
                'Empresa Terceirizada 1',
                Tp_Rel_Trabalha(
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.cpf = 05947772400)),
                        Tp_Ref_FuncionarioTerceirizado((SELECT REF(ft) FROM Tb_FuncionarioTerceirizado ft WHERE ft.cpf = 02791142495))
                )
        )
);

INSERT INTO Tb_Departamento VALUES (
        Tp_Departamento(
                Sq_Departamento.NEXTVAL,
                'Departamento 0',
                'Dp0',
                Tp_Rel_Pertence(
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpfe = 07526066462)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpf = 10712130403)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.cpf = 04242732414)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = 03406454402)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = 05947772400))
                )
        )
);
INSERT INTO Tb_Departamento VALUES (
        Tp_Departamento(
                Sq_Departamento.NEXTVAL,
                'Departamento 1',
                'Dp1',
                Tp_Rel_Pertence(
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f      WHERE f.cpf = 08244993448)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioEfetivo f      WHERE f.cpf = 07598759448)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = 06119597476)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = 02791142495)),
                        Tp_Ref_Funcionario((SELECT REF(f) FROM Tb_FuncionarioTerceirizado f WHERE f.cpf = 03862926478))
                )
        )
);

INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 0', 0.50, 1000, 200));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 1', 1.50, 1001, 201));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 2', 2.50, 1002, 202));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 3', 3.50, 1003, 203));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 4', 4.50, 1004, 204));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 5', 5.50, 1005, 205));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 6', 6.50, 1006, 206));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 7', 7.50, 1007, 207));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 8', 8.50, 1008, 208));
INSERT INTO Tb_Produto VALUES (Tp_Produto(Sq_Produto.NEXTVAL, 'Produto 9', 9.50, 1009, 209));

INSERT INTO Tb_Sessao VALUES (
        Tp_Sessao(
                Sq_Sessao.NEXTVAL,
                'Sessao 0',
                Tp_Rel_Contem(
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 1)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 2')),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 3)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 4)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 5))
                )
        )
);
INSERT INTO Tb_Sessao VALUES (
        Tp_Sessao(
                Sq_Sessao.NEXTVAL,
                'Sessao 1',
                Tp_Rel_Contem(
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 6)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 7)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 8)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 9)),
                        Tp_Ref_Produto((SELECT REF(p) FROM Tb_Produto p WHERE p.cod = 10))
                )
        )
);


INSERT INTO Tb_Pedido VALUES (Sq_Pedido.NEXTVAL, '01-JAN-2018');
INSERT INTO Tb_Pedido VALUES (Sq_Pedido.NEXTVAL, '01-FEB-2018');
INSERT INTO Tb_Pedido VALUES (Sq_Pedido.NEXTVAL, '01-MAR-2018');
INSERT INTO Tb_Pedido VALUES (Sq_Pedido.NEXTVAL, '01-APR-2018');
INSERT INTO Tb_Pedido VALUES (Sq_Pedido.NEXTVAL, '01-MAY-2018');

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
                Sq.Movimenta.NEXTVAL,
                '02-JAN-2018',
                'e',
                100
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 1'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 1'),
                Sq.Movimenta.NEXTVAL,
                '02-FEB-2018',
                'e',
                101
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 2'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 2'),
                Sq.Movimenta.NEXTVAL,
                '02-MAR-2018',
                'e',
                102
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 3'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 3'),
                Sq.Movimenta.NEXTVAL,
                '02-APR-2018',
                'e',
                103
        )
);
INSERT INTO Tb_Rel_Movimenta VALUES (
        Tp_Rel_Movimenta(
                (SELECT REF(f) FROM Tb_FuncionarioEfetivo f WHERE f.nome = 'Funcionario Efetivo 4'),
                (SELECT REF(p) FROM Tb_Produto p WHERE p.nome = 'Produto 4'),
                Sq.Movimenta.NEXTVAL,
                '02-MAY-2018',
                'e',
                104
        )
);
