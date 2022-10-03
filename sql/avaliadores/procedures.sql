------------------------Para inserir avaliadores--------------------

-- PrazoRespostaAvaliador
create or replace procedure InsertPrazoRespostaAvaliador(
    OUT dataEnvioConvN TIMESTAMP,
	IN prazoRespConvN INTERVAL
)
language plpgsql
as $$
declare
	dataEncontrada timestamp;
	cursorData refcursor;
begin
    open cursorData for INSERT INTO PrazoRespostaAvaliador (dataEnvioConv, prazoRespConv)
    VALUES (current_timestamp, prazoRespConvN) returning dataEnvioConv;
	fetch cursorData into dataEncontrada;
	select dataEncontrada into dataEnvioConvN;
	--raise notice 'Prazo: %', prazoRespConvN;
	--raise notice 'DataEnvioConvN: %', dataEnvioConvN;
end $$;

-- Avaliador
create or replace procedure InsertAvaliador(
    idAvaliadorN integer,
	prazoRespConvN interval
)
language plpgsql
as $$
declare
	dataConvite timestamp;
begin
	call InsertPrazoRespostaAvaliador(dataConvite, prazoRespConvN);
    INSERT INTO Avaliador(idAvaliador, dataEnvioConv, dataRespConv) VALUES (idAvaliadorN, dataConvite, current_date);
	--raise notice 'DataConvite: %', dataConvite;
end $$;

-- Exemplo de como colocar dados--------------------------------
/*do $$
declare
	dataEnvioConvN timestamp;
	--prazo interval;
	--dataFinal timestamp;
begin
	--dataEnvioConvN := current_timestamp;
	--prazo := '10 days';
	--select dataEnvioConvN + prazo into dataFinal;
	--raise notice 'dataFinal: %', dataFinal;
	call InsertAvaliador(2, dataEnvioConvN, NULL, '10 days'::interval);
	--call InsertPrazoRespostaAvaliador(dataEnvioConvN, '10 days'::interval);
end $$;*/
-----------------------------------------------------------------
-- Outro jeito de inserir avaliador------------------------------
/*drop procedure InsertAvaliador(
    idAvaliadorN integer,
    dataEnvioConvN timestamp,
    dataRespConvN date,
	prazoRespConvN interval
);
-- Avaliador
create or replace procedure InsertAvaliador(
    idAvaliadorN integer,
    --dataEnvioConvN timestamp,
    --dataRespConvN date,
	prazoRespConvN interval
)
language plpgsql
as $$
declare
	dataConvite timestamp;
begin
	call InsertPrazoRespostaAvaliador(dataConvite, prazoRespConvN);
    INSERT INTO Avaliador(idAvaliador, dataEnvioConv, dataRespConv) VALUES (idAvaliadorN, dataConvite, NULL);
	--raise notice 'DataConvite: %', dataConvite;
end $$;*/
-----------------------------------------------------------------
-- Avaliador Brasileiro
create or replace procedure InsertAvaliadorBrasileiro(
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
    complementoN varchar(25),
	prazoRespConvN interval
    --dataEnvioConvN timestamp,
    --dataRespConvN date,
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorAvaliador refcursor;
	avaliadorEncont refcursor;
begin
    call InsertBrasileiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN,
								   numeroTelefoneN, loginN, dominioN, cpfPessoaN, paisN, estadoN, cidadeN, bairroN, 
								   logradouroN, complementoN, idRec);
	open cursorAvaliador for select * from Brasileiro, Avaliador where Brasileiro.cpf = cpfPessoaN and 
	Brasileiro.idPessoa = Avaliador.idAvaliador;
	fetch cursorAvaliador into avaliadorEncont;
	close cursorAvaliador;
	if not found avaliadorEncont then
		call InsertAvaliador(idRec, prazoRespConvN);
	else
		raise notice 'Avaliador ja cadastrado! Id: %', idRec;
	end if;
end $$;

-- como usar:
/*call InsertAvaliadorBrasileiro('Brasileiro', 'Quatro', '12345-098', 10, 'Universidade', 55, 12, 34567, 5439, 
							   'brasQua', '@ufscar.br', 12345678903, 'Brasil', 'São Paulo', 'São Carlos', 
							   'Monjolinho', 'Rua Um', 'Apartamento 8', '10 days'::interval);*/


-- Avaliador Estrangeiro-----------------------------------------------------------------------------------------------------
create or replace procedure InsertAvaliadorEstrangeiro(
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
    complementoN varchar(25),
    --dataEnvioConv timestamp,
    --dataRespConv date 
	prazoRespConvN interval
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorAvaliador refcursor;
	avaliadorEncont refcursor;
begin
	open cursorAvaliador for select * from Estrangeiro, Avaliador where Estrangeiro.nroPassaporte = nroPassaporteN and 
	Estrangeiro.idPessoa = Avaliador.idAvaliador;
	fetch cursorAvaliador into avaliadorEncont;
	close cursorAvaliador;
    call InsertEstrangeiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN, 
									numeroTelefoneN, loginN, dominioN, nroPassaporteN, dataEmissaoN, dataExpiracaoN, 
									govEmissorN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, idRec);
	if not found avaliadorEncont then
		call InsertAvaliador(idRec, prazoRespConvN);
	else
		raise notice 'Avaliador já cadastrado! Id: %', idRec;
	end if;
end $$;
/*call  InsertAvaliadorEstrangeiro('Estrangeiro', 'Um', '13445-098', 20, 'University', 61, 34, 34562, 6483, 
'estrangUm', '@university.br', 'CL234563', '2010-04-28', '2023-05-23', 'Governo Italiano', 'Italia', 'Genova', 
'Genova', 'Bairro Um', 'Rua Dois', 'Apartamento 14', '10 days'::interval);*/	

--------------------------------------------------------------------------------------------------------------------------------

-- Areas ------------------------------------------------------------------------------------
-- Insert Areas
create or replace procedure InsertAreas(
    areaN varchar(20)
)
language plpgsql
as $$
declare
	cursorArea refcursor;
	areaEnc refcursor;
begin
	open cursorArea for select area from Areas where Areas.area = areaN;
	fetch cursorArea into areaEnc;
	close cursorArea;
	if not found areaEnc then
    	INSERT INTO Areas(area) VALUES (areaN);
	else
		raise notice 'Area % ja cadastrada', areaEnc;
	end if;
end $$;

-- Insert Areas Aptas
create or replace procedure InsertAreasAptas(
    idAvaliadorN INTEGER,
	areaAptaN VARCHAR(20)
)
language plpgsql
as $$
declare
	cursorAreaAv refcursor;
	areaEnc refcursor;
begin
	open cursorAreaAv for select * from AreasAptas where AreasAptas.idAvaliador = idAvaliadorN
	and AreasAptas.areaApta = areaAptaN;
	fetch cursorAreaAv into areaEnc;
	close cursorAreaAv;
	if not found areaEnc then
    	INSERT INTO AreasAptas(idAvaliador, areaApta) VALUES (idAvaliadorN, areaAptaN);
	else
		raise notice 'Area apta ja cadastrada para este avaliador';
	end if;
end $$;

-- Insert areas inaptas
create or replace procedure InsertAreasInaptas(
    idAvaliadorN INTEGER,
	areaInaptaN VARCHAR(20)
)
language plpgsql
as $$
declare
	cursorAreaAv refcursor;
	areaEnc refcursor;
begin
	open cursorAreaAv for select * from AreasInaptas where AreasInaptas.idAvaliador = idAvaliadorN
	and AreasInaptas.areaInapta = areaInaptaN;
	fetch cursorAreaAv into areaEnc;
	close cursorAreaAv;
	if not found areaEnc then
    	INSERT INTO AreasInaptas(idAvaliador, areaInapta) VALUES (idAvaliadorN, areaInaptaN);
	else
		raise notice 'Area inapta ja cadastrada para este avaliador';
	end if;
end $$;

-- InsertCertificadoAvaliador
create or replace procedure InsertCertificadoAvaliador(
	idAvaliadorN INTEGER,
	codCertificadoN integer
)
language plpgsql
as $$
begin
    INSERT INTO CertificadoAvaliador(idAvaliador, codCertificado)
    VALUES (idAvaliadorN, codCertificadoN);
end $$;


