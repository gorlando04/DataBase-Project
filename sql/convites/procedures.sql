-- Inserção na tabela CandidatoAPalestrante
create or replace procedure InsertCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    pessoaQueIndicou VARCHAR(50),
    contatoPessoaIndicou VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO CandidatoAPalestrante(emailPrincipal, pessoaQueIndicou, contatoPessoaIndicou)
	VALUES (emailPrincipal, pessoaQueIndicou, contatoPessoaIndicou);
	commit;
end;$$;

-- Atualização da tabela CandidatoAPalestrante
create or replace procedure UpdateCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    pessoaQueIndicou VARCHAR(50),
    contatoPessoaIndicou VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE CandidatoAPalestrante
	SET pessoaQueIndicou = pessoaQueIndicou AND 
        contatoPessoaIndicou = contatoPessoaIndicou
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$;

-- Inserção na tabela DescricaoCandidato
create or replace procedure InsertDescricaoCandidato (
    miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50),
    nome VARCHAR(50),
    foto bytea,
    emailPrincipal VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO DescricaoCandidato(miniCurriculo, areaDeAtuacao, nome, foto, emailPrincipal)
	VALUES (miniCurriculo, areaDeAtuacao, nome, foto, emailPrincipal);
	commit;
end;$$;

-- Atualização da tabela DescricaoCandidato
create or replace procedure UpdateDescricaoCandidato (
    miniCurriculo VARCHAR(500),
    areaDeAtuacao VARCHAR(50),
    nome VARCHAR(50),
    foto bytea,
    emailPrincipal VARCHAR(50)

)
language plpgsql
as $$
begin
	UPDATE DescricaoCandidato
	SET areaDeAtuacao = areaDeAtuacao AND 
        nome = nome AND 
        foto = foto AND
        emailPrincipal = emailPrincipal
    WHERE miniCurriculo = miniCurriculo;
	commit;
end;$$;

-- Inserção na tabela LinksTrabalhosCandPalest
create or replace procedure InsertLinksTrabalhosCandPalest (
    emailPrincipal VARCHAR(50),
    titulo VARCHAR (50),
    uniclink VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO LinksTrabalhosCandPalest(emailPrincipal, titulo, uniclink)
	VALUES (emailPrincipal, titulo, uniclink);
	commit;
end;$$;

-- Atualização da tabela LinksTrabalhosCandPalest
create or replace procedure UpdateLinksTrabalhosCandPalest (
    emailPrincipal VARCHAR(50),
    titulo VARCHAR (50),
    uniclink VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE LinksTrabalhosCandPalest
	SET uniclink = uniclink 
    WHERE emailPrincipal = emailPrincipal AND titulo = titulo;
	commit;
end;$$;

-- Inserção na tabela EmailsSecundariosCandPalest
create or replace procedure InsertEmailsSecundariosCandPalest (
    emailPrincipal VARCHAR(50),
    email VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO EmailsSecundariosCandPalest(emailPrincipal, email)
	VALUES (emailPrincipal, email);
	commit;
end;$$;

-- Atualização da tabela EmailsSecundariosCandPalest
create or replace procedure UpdateCandidatoAPalestrante (
    emailPrincipal VARCHAR(50),
    email VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE EmailsSecundariosCandPalest
	SET email = email
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$;

-- Inserção na tabela TelefonesCandidatoPalest
create or replace procedure InsertTelefonesCandidatoPalest (
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO TelefonesCandidatoPalest(emailPrincipal, telefone)
	VALUES (emailPrincipal, telefone);
	commit;
end;$$;

-- Atualização da tabela TelefonesCandidatoPalest
create or replace procedure UpdateTelefonesCandidatoPalest (
    emailPrincipal VARCHAR(50),
    telefone VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE TelefonesCandidatoPalest
	SET telefone = telefone 
    WHERE emailPrincipal = emailPrincipal;
	commit;
end;$$;

-- Inserção na tabela Abordagem
create or replace procedure InsertAbordagem (
    idCompostoPor INTEGER,
    emailPrincipal VARCHAR(50),
    dataHoraAbordagem date,
    conteudo VARCHAR(500),
    meioComunicacao1 VARCHAR(50),
    meioComunicacao2 VARCHAR(50),
    meioComunicacao3 VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO Abordagem(idCompostoPor,emailPrincipal, dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3)
	VALUES (idCompostoPor,emailPrincipal, dataHoraAbordagem, conteudo, meioComunicacao1, meioComunicacao2, meioComunicacao3);
	commit;
end;$$;

-- Atualização da tabela Abordagem
create or replace procedure UpdateAbordagem (
   
    idAbordagem INTEGER,
    emailPrincipal VARCHAR(50),
    dataHoraAbordagem date,
    conteudo VARCHAR(500),
    meioComunicacao1 VARCHAR(50),
    meioComunicacao2 VARCHAR(50),
    meioComunicacao3 VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE Abordagem
	SET idCompostoPor = idCompostoPor AND
        emailPrincipal = emailPrincipal AND 
        dataHoraAbordagem = dataHoraAbordagem AND 
        conteudo = conteudo AND
        meioComunicacao1 = meioComunicacao1 AND
        meioComunicacao2 = meioComunicacao2 AND
        meioComunicacao3 = meioComunicacao3 

    	WHERE idAbordagem = idAbordagem;
	commit;
end;$$;

-- Inserção na tabela CronogramaPalestra
create or replace procedure InsertCronogramaPalestra (
    idAbordagem INTEGER,
    idPalestra INTEGER,
    tipoEvento VARCHAR(50),
    dataDaPalestra date,
    horaDaPalestra time,
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO CronogramaPalestra(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio, idAbordagem, idPalestra)
	VALUES (tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio, idAbordagem, idPalestra);
	commit;
end;$$;

-- Atualização da tabela CronogramaPalestra
create or replace procedure UpdateCronogramaPalestra (
   
    idAbordagem INTEGER,
    idPalestra INTEGER,
    tipoEvento VARCHAR(50),
    dataDaPalestra date,
    horaDaPalestra time,
    duracaoPrevista interval,
    numeroDeSala INTEGER,
    predio VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE CronogramaPalestra
	SET idPalestra = idPalestra AND
        tipoEvento = tipoEvento AND 
        dataDaPalestra = dataDaPalestra AND 
        horaDaPalestra = horaDaPalestra AND
        duracaoPrevista = duracaoPrevista AND
        numeroDeSala = numeroDeSala AND
        predio = predio

    	WHERE idAbordagem = idAbordagem;
	commit;
end;$$;

-- Inserção na tabela Palestras
create or replace procedure InsertPalestras (
    idAbordagem INTEGER,
    tituloDaPalestra VARCHAR(50),
    resumoDaPalestra VARCHAR(500),
    materialDeApoio VARCHAR(500)
)
language plpgsql
as $$
begin
	INSERT INTO Palestras(idAbordagem, resumoDaPalestra, materialDeApoio, tituloDaPalestra)
	VALUES (idAbordagem, resumoDaPalestra, materialDeApoio, tituloDaPalestra);
	commit;
end;$$;

-- Atualização da tabela Palestras
create or replace procedure UpdatePalestras (
    idAbordagem INTEGER,
    tituloDaPalestra VARCHAR(50),
    resumoDaPalestra VARCHAR(500),
    materialDeApoio VARCHAR(500)
)
language plpgsql
as $$
begin
	UPDATE Palestras
	SET idAbordagem = idAbordagem AND
        tituloDaPalestra = tituloDaPalestra AND
        resumoDaPalestra = resumoDaPalestra AND 
        materialDeApoio = materialDeApoio

    	WHERE idPalestra = idPalestra;
	commit;
end;$$;

-- Inserção na tabela PredioPalestra
create or replace procedure InsertPredioPalestra (
    numeroDeSala INTEGER,
    andar INTEGER,
    predio VARCHAR(50)
)
language plpgsql
as $$
begin
	INSERT INTO PredioPalestra(andar, predio, numeroDeSala)
	VALUES (andar, predio, numeroDeSala);
	commit;
end;$$;

-- Atualização da tabela PredioPalestra
create or replace procedure UpdatePredioPalestra (
   
    numeroDeSala INTEGER,
    andar INTEGER,
    predio VARCHAR(50)
)
language plpgsql
as $$
begin
	UPDATE PredioPalestra
	SET andar = andar AND 
        predio = predio

    	WHERE numeroDeSala = numeroDeSala;
	commit;
end;$$;

-- Inserção na tabela DocumentosCronogramaPalestra
create or replace procedure InsertDocumentosCronogramaPalestra (
    idAbordagem INTEGER,
    dataEntrega timestamp,
    documento bytea,
    tituloDocumento varchar(20),
    tipo varchar(5),
    statusAtendimentoEnvio varchar (20)
)
language plpgsql
as $$
begin
	INSERT INTO DocumentosCronogramaPalestra(dataEntrega, tipo, idAbordagem, documento, tituloDocumento, statusAtendimentoEnvio )
	VALUES (dataEntrega, tipo, idAbordagem, documento, tituloDocumento, statusAtendimentoEnvio);
	commit;
end;$$;

-- Atualização da tabela DocumentosCronogramaPalestra
create or replace procedure UpdateDocumentosCronogramaPalestra (
    idAbordagem INTEGER,
    dataEntrega timestamp,
    documento bytea,
    tituloDocumento varchar(20),
    tipo varchar(5),
    statusAtendimentoEnvio varchar (20)
)
language plpgsql
as $$
begin
	UPDATE DocumentosCronogramaPalestra
	SET 
        statusAtendimentoEnvio = statusAtendimentoEnvio AND
        documento = documento AND 
        tipo = tipo

    	WHERE idAbordagem = idAbordagem AND dataEntrega = dataEntrega AND tituloDocumento = tituloDocumento ;
	commit;
end;$$;
