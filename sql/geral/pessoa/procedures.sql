-- Procedures e functions para inserção de pessoas
-------------------Para inserir todas as pessoas---------------------
-- Function para inserir pessoa e recuperar id
create or replace function InsertPessoa(
    primeiroNomeNovo varchar(50),
    sobrenomeNovo varchar(100),
    cepNovo varchar(10),
    numeroNovo integer,
    complementoNovo varchar(25),
    filiacaoNovo varchar(50)
)
returns integer as $$
declare
	idRec integer := 0;
	cursorId refcursor;
begin
    Open cursorId for INSERT INTO Pessoa(primeiroNome, sobrenome, cep, numero, complemento)    
	VALUES (primeiroNomeNovo, sobrenomeNovo, cepNovo, numeroNovo, complementoNovo) RETURNING idPessoa;
    fetch cursorId into idRec;
    INSERT INTO PessoaFiliacao(idPessoa, filiacao) 
    VALUES (idRec, filiacaoNovo);
	close cursorId;
	raise notice 'Valor do id: %', idRec;
	--commit;
	return idRec;
end; $$
language plpgsql;
/*
do $$
declare
	idEncontrado integer := 0;
	cursorIdEnc refcursor;
begin
	Open cursorIdEnc for select InsertPessoa('Brasileiro', 'TestFunction Tres', '12345-098', 15, 'Universidade');
	fetch cursorIdEnc into idEncontrado;
	raise notice 'Valor do id: %', idEncontrado;
	close cursorIdEncontrado;
end $$
language plpgsql;
 */
 
 --Procedure Telefone Pessoa---------------------------
create or replace procedure InsertTelefonePessoa(
    idPessoaN integer,
    ddiN integer,
    dddN integer,
    prefixoN integer,
    nroTelefoneN integer
) 
language plpgsql
as $$
declare 
	cursorExiste refcursor;
	telefoneExiste refcursor;
begin
	Open cursorExiste for select * from TelefonePessoa where 
	TelefonePessoa.idPessoa = idPessoaN and
	TelefonePessoa.ddi = ddiN and
	TelefonePessoa.ddd = dddN and
	TelefonePessoa.prefixo = prefixoN and
	TelefonePessoa.numeroTelefone = nroTelefoneN;
	fetch cursorExiste into telefoneExiste;
	close cursorExiste;
	if not found telefoneExiste then
    	INSERT INTO TelefonePessoa(idPessoa, ddi, ddd, prefixo, numeroTelefone)
    	VALUES (idPessoaN, ddiN, dddN, prefixoN, nroTelefoneN);
		--commit;
	else
		raise notice 'Telefone já cadastrado';
	end if;
end $$;

-- Procedure Email pessoa-------------------------------------
create or replace procedure InsertEmailPessoa(
    idPessoaN integer,
    loginN varchar(50),
    dominioN varchar(50)
)
language plpgsql
as $$
declare 
	cursorExiste refcursor;
	emailExiste refcursor;
begin
	Open cursorExiste for select * from EmailPessoa where 
	EmailPessoa.idPessoa = idPessoaN and
	EmailPessoa.login = loginN and
	EmailPessoa.dominio = dominioN;
	fetch cursorExiste into emailExiste;
	close cursorExiste;
	if not found emailExiste then
    	INSERT INTO EmailPessoa(idPessoa, login, dominio)
    	VALUES (idPessoaN, loginN, dominioN);
    	--commit;
	else
		raise notice 'Email já cadastrado';
	end if;
end $$;
--call InsertTelefonePessoa(20, 55, 12, 34007, 6008);
--call InsertEmailPessoa(2, 'brasDez', '@ufscar.br');
--select * from TelefonePessoa;
--select * from EmailPessoa;

--Procedure insert Atributos pessoa
create or replace procedure InsertPessoaAtributos(
    primeiroNomeN varchar(50),
    sobrenomeN varchar(100),
    cepN varchar(10),
    numeroN integer,
	paisN varchar(20),
    estadoN varchar(20),
    cidadeN varchar(35),
    bairroN varchar(35),  
    logradouroN varchar(25),
    complementoN varchar(25),
    filiacaoN varchar(50),
    ddiN integer,
    dddN integer,
    prefixoN integer,
    numeroTelefoneN integer,
    loginN varchar(50),
    dominioN varchar(50)
	-- OUT idRecuperado integer
)
language plpgsql as $$
declare 
	idRec integer;
	cursorId refcursor;
begin
    call InsertEndereco(cepN, numeroN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN);
    Open cursorId for select InsertPessoa(primeiroNomeN, sobrenomeN, cepN, numeroN, complementoN, filiacaoN);
    fetch cursorId into idRec;
	-- select idRec into idRecuperado;
	-- raise notice 'IdRecuperado: %', idRecuperado;
	close cursorId;
	call InsertTelefonePessoa(idRec, ddiN, dddN, prefixoN, numeroTelefoneN);
    call InsertEmailPessoa(idRec, loginN, dominioN);
    --commit;
end $$;

--Exemplo para recuperar o id do usuario no procedure
/*
do $$
declare
	idRecuperado integer := 0;
	--cursorRec refcursor;
begin
	call InsertPessoaAtributos('Brasileiro', 'Treze', '12345-690', 13,  'Brasil', 'São Paulo', 'São Carlos', 'Monjolinho',  'Rua Um', 'Apartamento 5', 'Universidade', 55, 12, 34567, 5234, 'brasTres', '@ufscar.br', idRecuperado);
	raise notice 'Recuperado: %', idRecuperado;
end $$ language plpgsql;*/
-------------------Para inserir todas as pessoas---------------------

---------------------Para inserir brasileiros------------------------
create or replace procedure InsertBrasileiro(
    idPessoaN integer,
    cpfPessoaN bigint
)
language plpgsql
as $$
begin
    INSERT INTO Brasileiro(cpf, idPessoa)
    VALUES (cpfPessoaN, idPessoaN);
    --commit;
end $$;

-- Procedure InsertBrasileiro
create or replace procedure InsertBrasileiroAtributos(
    primeiroNomeN varchar(50),
    sobrenomeN varchar(100),
    cepN varchar(10),
    numeroN integer,
    filiacaoN varchar(50),
    ddiN integer,
    dddN integer,
    prefixoN integer,
    numeroTelefoneN integer,
    loginN varchar(50),
    dominioN varchar(50),
    cpfPessoaN bigint,
    paisN varchar(20),
    estadoN varchar(20),
    cidadeN varchar(35),
    bairroN varchar(35),  
    logradouroN varchar(25),
    complementoN varchar(25)
    --OUT idPessoaRec integer
)
language plpgsql as $$
declare 
	idRec integer := 0;
	cursorCpf refcursor;
	recuperaCpf refcursor;
begin
    Open cursorCpf for select * from Brasileiro where Brasileiro.cpf = cpfPessoaN;
	fetch cursorCpf into recuperaCpf;
	if not found recuperaCpf then
		call InsertPessoaAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN, idRec);  
    	call InsertBrasileiro(idRec, cpfPessoaN); 
    	--raise notice 'idRec:%', idRec;
		-- select idRec into idPessoaRec;
		--raise notice 'idPessoaRec:%', idPessoaRec;
	else
		select idPessoa from Brasileiro where Brasileiro.cpf = cpfPessoaN into idRec;
		-- select idRec into idPessoaRec;
		raise notice 'idRec:%', idRec;
		raise notice 'CPF ja cadastrado';
	end if;
end $$;
---------------------Para inserir brasileiros------------------------

---------------------Para inserir estrangeiros-----------------------
-- Inserir Numero Passaporte
create or replace procedure InsertEstrangeiro(
    idPessoaN integer,
    nroPassaporteN varchar(20)  
)
language plpgsql
as $$
begin
    INSERT INTO Estrangeiro(idPessoa, nroPassaporte)
    VALUES (idPessoaN, nroPassaporteN);
    --commit;
end $$;

-- Procedures Informações Passaporte
create or replace procedure InsertEstrangeiroNroPassaporte(
    nroPassaporteN varchar(20),
    dataEmissaoN date,
    dataExpiracaoN date,
    govEmissorN varchar(50)
) 
language plpgsql
as $$
begin
    INSERT INTO EstrangeiroNroPassaporte(nroPassaporte, dataEmissao, dataExpiracao, govEmissor)
    VALUES (nroPassaporteN, dataEmissaoN, dataExpiracaoN, govEmissorN);
    --commit;
end $$;

-- Procedure inserção de estrangeiro
create or replace procedure InsertEstrangeiroAtributos(
    primeiroNomeN varchar(50),
    sobrenomeN varchar(100),
    cepN varchar(10),
    numeroN integer,
    filiacaoN varchar(50),
    ddiN integer,
    dddN integer,
    prefixoN integer,
    numeroTelefoneN integer,
    loginN varchar(50),
    dominioN varchar(50),
    nroPassaporteN varchar(20),
    dataEmissaoN date,
    dataExpiracaoN date,
    govEmissorN varchar(50),
    paisN varchar(20),
    estadoN varchar(20),
    cidadeN varchar(35),
    bairroN varchar(35),  
    logradouroN varchar(25),
    complementoN varchar(25)
	--OUT idPessoaRec integer
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorNroPass refcursor;
	nroPassEnc refcursor;
begin
	Open cursorNroPass for select * from Estrangeiro where Estrangeiro.nroPassaporte = nroPassaporteN;
	fetch cursorNroPass into nroPassEnc;
	close cursornroPass;
	if not found nroPassEnc then
    	call InsertPessoaAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN,  idRec);
    	call InsertEstrangeiro(idRec, nroPassaporteN);
    	call InsertEstrangeiroNroPassaporte(nroPassaporteN, dataEmissaoN, dataExpiracaoN, govEmissorN); 
		-- select idRec into idPessoaRec;
    	--commit;
	else
		select idPessoa from Estrangeiro where Estrangeiro.nroPassaporte = nroPassaporteN into idRec;
		--select idRec into idPessoaRec;
		raise notice 'Numero de Passaporte ja cadastrado';
		raise notice 'idPessoaRec: %', idPessoaRec;
	end if;
end $$;

---------------------Para inserir estrangeiros-----------------------


