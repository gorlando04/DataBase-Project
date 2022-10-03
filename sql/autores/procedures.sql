------------------------Para inserir autores------------------------
-- Autor
create or replace procedure InsertAutor(
    idAutorN integer
)
language plpgsql
as $$
begin
    INSERT INTO Autor(idAutor) VALUES (idAutorN);
    --commit;
end $$;

-- Autor brasileiro ------------------------------------------------
create or replace procedure InsertAutorBrasileiro(
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
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorAutor refcursor;
	autorEncont refcursor;
begin
	
    call InsertBrasileiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN, cpfPessoaN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, idRec);
    open cursorAutor for select * from Brasileiro, Autor where Brasileiro.cpf = cpfPessoaN and 
	Brasileiro.idPessoa = Autor.idAutor;
	fetch cursorAutor into autorEncont;
	close cursorAutor;
	if not found autorEncont then
		INSERT INTO Autor(idAutor) VALUES (idRec);
		--commit;
	else 
		raise notice 'Autor já cadastrado';
	end if;
end $$;

--Autor Estrangeiro--------------------------------------------
create or replace procedure InsertAutorEstrangeiro(
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
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorAutor refcursor;
	autorEncont refcursor;
begin
	open cursorAutor for select * from Estrangeiro, Autor where Estrangeiro.nroPassaporte = nroPassaporteN and 
	Estrangeiro.idPessoa = Autor.idAutor;
	fetch cursorAutor into autorEncont;
	close cursorAutor;
    call InsertEstrangeiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN, nroPassaporteN, dataEmissaoN, dataExpiracaoN, govEmissorN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, idRec);
	if not found autorEncont then
		INSERT INTO Autor(idAutor) VALUES (idRec);
    	--commit;
	else 
		raise notice 'Autor já cadastrado';
	end if;
end $$;
------------------------Para inserir autores------------------------

------------------------Para submeter trabalhos---------------------
--InsertOrdemAutoria
create or replace procedure InsertOrdemAutoria(
    idAutorN INTEGER,
    ordemAutorN INTEGER
)
language plpgsql
as $$
begin
    INSERT INTO OrdemAutoria(idAutor, ordemAutor)
    VALUES (idAutorN, ordemAutorN);
    commit;
end $$;

--InsertSubmeteTrabalho
create or replace procedure InsertSubmeteTrabalho(
    idAutorN INTEGER,
    idTrabalhoN INTEGER,
    idAutoriaN INTEGER
)
language plpgsql
as $$
begin
    INSERT INTO SubmeteTrabalho(idAutor, idTrabalho, idAutoria)
    VALUES (idAutorN, idTrabalhoN, idAutoriaN);
    commit;
end $$;
------------------------Para submeter trabalhos---------------------

