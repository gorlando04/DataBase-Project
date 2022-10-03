-- Inserções nas tabelas
-- Membro Comite Convites Brasileiro
call InsertBrasileiroAtributos('Brasileiro', 'Um', '12345-098', 15, 'Universidade', 55, 12, 34567, 8909, 'brasUm', '@ufscar.br', 12345678900, 'Brasil', 'São Paulo', 'São Carlos', 'Monjolinho', 'Rua Um', 'Apartamento 9');
-- Membro Comite Editais Brasileiro
call InsertBrasileiroAtributos('Brasileiro', 'Dois', '12345-098', 13, 'Universidade', 55, 12, 34567, 6568, 'brasDois', '@ufscar.br', 12345678901, 'Brasil', 'São Paulo', 'São Carlos', 'Monjolinho', 'Rua Um', 'Apartamento 10');
-- Autor Brasileiro
call InsertBrasileiroAtributos('Brasileiro', 'Tres', '12345-098', 17, 'Universidade', 55, 12, 34567, 5234, 'brasTres', '@ufscar.br', 12345678902, 'Brasil', 'São Paulo', 'São Carlos', 'Monjolinho',  'Rua Um', 'Apartamento 5');
-- Avaliador Brasileiro
call InsertBrasileiroAtributos('Brasileiro', 'Quatro', '12345-098', 10, 'Universidade', 55, 12, 34567, 5439, 'brasQua', '@ufscar.br', 12345678903, 'Brasil', 'São Paulo', 'São Carlos', 'Monjolinho', 'Rua Um', 'Apartamento 8');
-- Autor Estrangeiro
call InsertEstrangeiroAtributos('Estrangeiro', 'Um', '13445-098', 20, 'University', 61, 34, 34562, 6483, 'estrangUm', '@university.br', 'CL234563', '2010-04-28', '2023-05-23', 'Governo Italiano', 'Italia', 'Genova', 'Genova', 'Bairro Um', 'Rua Dois', 'Apartamento 14');

call InsertAutorEstrangeiro('Estrangeiro', 'Dois', '13444-098', 20, 'Universidade Um', 55, 34, 5905, 6483, 'brasCinco', '@universidadeum.br', 'CD123456', '2010-04-03', '2023-05-03', 'Governo Italiano', 'Italia', 'Roma', 'Vaticano', 'Bairro Dois', 'Rua Cinco', 'Apartamento 28');

call InsertEndereco('12345-678', 1, 'Brasil', 'Para', 'Belem', 'Bairro de Belem', 'Rua de Belem', 'Casa 1');

insert into pessoa(primeiroNome, sobrenome, cep, numero)
values('Brasileiro', 'Teste Dois', '12345-098', 15) RETURNING idPessoa;
