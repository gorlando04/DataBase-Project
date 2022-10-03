-- Anotações:
-- Falta criar os procedures de Edital
-- Nos inserts precisa inserir também os que são do tipo SERIAL? (Ex: EixosApresentacao)
-- Ainda tem que ver se precisa atualizar o idEdital em alguns casos (tipo no trabalho)

-- Inserção na tabela Edital
CREATE or REPLACE PROCEDURE InsertEdital(
    idEdital INTEGER,
    sigla VARCHAR(8),
    url VARCHAR(64),
    dataUltimaEdicao DATE,
    dataPublicacaoOriginal DATE
)
language plpgsql
as $$
begin   
    INSERT INTO Edital(idEdital, sigla, url, dataUltimaEdicao, dataPublicacaoOriginal)
    VALUES(idEdital, sigla, url, dataUltimaEdicao, dataPublicacaoOriginal);
    commit;
end;$$;

--Atualização na tabela Edital
CREATE or REPLACE PROCEDURE UpdateEdital(
    idEdital INTEGER,
    sigla VARCHAR(8),
    url VARCHAR(64),
    dataUltimaEdicao DATE,
    dataPublicacaoOriginal DATE
)
language plpgsql
as $$
begin   
    UPDATE Edital
    SET sigla = sigla AND  url = url AND dataUltimaEdicao = dataUltimaEdicao AND dataPublicacaoOriginal = dataPublicacaoOriginal
    WHERE idEdital = idEdital;
    commit;
end;$$;

-- Inserção na tabela IdiomasAceitos
CREATE or REPLACE PROCEDURE InsertIdiomasAceitos (
    idEdital INTEGER 
)
language plpgsql
as $$
begin
    INSERT INTO IdiomasAceitos(idioma, idEdital)
    VALUES ('P', idEdital);
    VALUES ('I', idEdital);
    VALUES ('E', idEdital);
    commit;
end;$$;

-- Atualização da tabela IdiomasAceitos
CREATE or REPLACE PROCEDURE UpdateIdiomasAceitos (
    idioma CHAR,
    idiomaNovo CHAR,
    idEdital INTEGER 
)
language plpgsql
as $$
begin
    UPDATE IdiomasAceitos
    SET idioma = idiomaNovo
    WHERE idEdital = idEdital AND idioma = idioma;
    commit;
end;$$;

-- Inserção na tabela EixosApresentacao 
CREATE or REPLACE PROCEDURE InsertEixosApresentacao (
    idEixo INTEGER,
    idEdital INTEGER,
    nomeEixo VARCHAR(20)
)
language plpgsql
as $$
begin
    INSERT INTO EixosApresentacao(idEixo, idEdital, nomeEixo)
    VALUES (idEixo, idEdital, nomeEixo);
    commit;
end;$$;

-- Atualização da tabela EixosApresentacao 
CREATE or REPLACE PROCEDURE UpdateEixosApresentacao (
    idEixo INTEGER,
    idEdital INTEGER,
    nomeEixo VARCHAR(20) 
)
language plpgsql
as $$
begin
    UPDATE EixosApresentacao
    SET idEdital = idEdital AND
        nomeEixo = nomeEixo
        WHERE idEixo = idEixo;
    commit;
end;$$;

-- Inserção na tabela SubEixosApresentacao
CREATE or REPLACE PROCEDURE InsertSubEixosApresentacao (
    idEixo INTEGER,
    nomeSubEixo VARCHAR(20)  
)
language plpgsql
as $$
begin
    INSERT INTO EixosApresentacao(idEixo, nomeSubEixo)
    VALUES (idEixo, nomeSubEixo);
    commit;
end;$$;

-- Atualização da tabela SubEixosApresentacao 
CREATE or REPLACE PROCEDURE UpdateSubEixosApresentacao (
    idEixo INTEGER,
    nomeSubEixo VARCHAR(20)    
)
language plpgsql
as $$
begin
    UPDATE EixosApresentacao
    SET nomeSubEixo = nomeSubEixo
        WHERE idEixo = idEixo;
    commit;
end;$$;

-- Inserção na tabela AreasApresentacao
create or replace procedure InsertAreasApresentacao(
    idArea INTEGER,
    idEdital INTEGER,
    nomeArea VARCHAR(20)
)
language plpgsql
as $$
begin
	INSERT INTO AreasApresentacao(idArea, idEdital, nomeArea)
	VALUES (idArea, idEdital, nomeArea);
	commit;
end;$$;

-- Atualização da tabela AreasApresentacao
create or replace procedure UpdateAreasApresentacao(
    idArea INTEGER,
    idEdital INTEGER,
    nomeArea VARCHAR(20)
)
language plpgsql
as $$
begin
	UPDATE AreasApresentacao
	SET idEdital = idEdital AND nomeArea = nomeArea
    	WHERE idArea = idArea;
	commit;
end;$$;

-- Inserção na tabela SubAreasApresentacao
create or replace procedure InsertSubAreasApresentacao(
    idArea INTEGER,
    nomeSubArea VARCHAR(20)
)
language plpgsql
as $$
begin
	INSERT INTO SubAreasApresentacao(idArea, nomeSubArea)
	VALUES (idArea, nomeSubArea);
	commit;
end;$$;

-- Atualização da tabela SubAreasApresentacao
create or replace procedure UpdateSubAreasApresentacao(
    idArea INTEGER,
    nomeSubArea VARCHAR(20)
)
language plpgsql
as $$
begin
	UPDATE SubAreasApresentacao
	SET nomeSubArea = nomeSubArea
   	WHERE idArea = idArea;
	commit;
end;$$;

-- Inserção na tabela Regras
create or replace procedure InsertRegras(
    idEdital INTEGER,
    descricao VARCHAR(200),
    modelo BYTEA
)
language plpgsql
as $$
begin
	INSERT INTO Regras(idEdital, descricao, modelo)
	VALUES (idEdital, descricao, modelo);
	commit;
end;$$;

-- Atualização da tabela Regras
create or replace procedure UpdateRegras(
    idEdital INTEGER,
    descricao VARCHAR(200),
    modelo BYTEA
)
language plpgsql
as $$
begin
	UPDATE Regras
	SET descricao = descricao AND modelo = modelo
    	WHERE idEdital = idEdital;
	commit;
end;$$;

-- Inserção na tabela CronogramaEdital
create or replace procedure InsertCronogramaEdital(
    idEdital INTEGER,
    dataPublicacaoOriginal DATE,
    intervaloRealizacao INTERVAL,
    dataDivulgacaoListaAprovados DATE
)
language plpgsql
as $$
begin
	INSERT INTO CronogramaEdital(idEdital, dataPublicacaoOriginal, intervaloRealizacao, dataDivulgacaoListaAprovados)
	VALUES (idEdital, dataPublicacaoOriginal, intervaloRealizacao, dataDivulgacaoListaAprovados);
	commit;
end;$$;

-- Atualização da tabela CronogramaEdital
create or replace procedure UpdateCronogramaEdital(
    idCronogramaEdital INTEGER,
    dataPublicacaoOriginal DATE,
    intervaloRealizacao INTERVAL,
    dataDivulgacaoListaAprovados DATE
)
language plpgsql
as $$
begin
	UPDATE CronogramaEdital
	SET dataPublicacaoOriginal = dataPublicacaoOriginal AND intervaloRealizacao = intervaloRealizacao AND dataDivulgacaoListaAprovados = dataDivulgacaoListaAprovados
        WHERE idCronogramaEdital = idCronogramaEdital;
	commit;
end;$$;

-- Inserção na tabela PeriodoInscricoesEdital
create or replace procedure InsertPeriodoInscricoesEdital(
    idCronogramaEdital INTEGER,
    inicioPeriodoI DATE,
    fimPeriodoI DATE
)
language plpgsql
as $$
begin
	INSERT INTO PeriodoInscricoesEdital(idCronogramaEdital, inicioPeriodoI, fimPeriodoI)
	VALUES (idCronogramaEdital, inicioPeriodoI, fimPeriodoI);
	commit;
end;$$;

-- Atualização da tabela PeriodoInscricoesEdital
create or replace procedure UpdatePeriodoInscricoesEdital(
    idCronogramaEdital INTEGER,
    inicioPeriodoI DATE,
    fimPeriodoI DATE
)
language plpgsql
as $$
begin
	UPDATE PeriodoInscricoesEdital
	SET inicioPeriodoI = inicioPeriodoI AND fimPeriodoI = fimPeriodoI
        WHERE idCronogramaEdital = idCronogramaEdital;
	commit;
end;$$;

-- Inserção na tabela PeriodoSubmissoesEdital
create or replace procedure InsertPeriodoSubmissoesEdital(
    idCronogramaEdital INTEGER,
    inicioPeriodoS DATE,
    fimPeriodoS DATE
)
language plpgsql
as $$
begin
	INSERT INTO PeriodoSubmissoesEdital(idCronogramaEdital, inicioPeriodoS, fimPeriodoS)
	VALUES (idCronogramaEdital, inicioPeriodoS, fimPeriodoS);
	commit;
end;$$;

-- Atualização da tabela PeriodoSubmissoesEdital
create or replace procedure UpdatePeriodoSubmissoesEdital(
    idCronogramaEdital INTEGER,
    inicioPeriodoS DATE,
    fimPeriodoS DATE
)
language plpgsql
as $$
begin
	UPDATE PeriodoSubmissoesEdital
	SET inicioPeriodoS = inicioPeriodoS AND fimPeriodoS = fimPeriodoS
    	WHERE idCronogramaEdital = idCronogramaEdital;
	commit;
end;$$;

-- Inserção na tabela Trabalho
create or replace procedure InsertTrabalho (
    idEdital INTEGER,
    titulo VARCHAR(64),
    palavraChave1 VARCHAR(16),
    palavraChave2 VARCHAR(16),
    palavraChave3 VARCHAR(16),
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    idiomaPrincipal CHAR,
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    status VARCHAR(16),
    tipoTrabalho VARCHAR(32),
    areaTrabalho INTEGER
)
language plpgsql
as $$
begin
	INSERT INTO Trabalho(idEdital, titulo, palavraChave1, palavraChave2, palavraChave3, palavraChave4, palavraChave5, idiomaPrincipal, idioma2, idioma3, descricao, status, tipoTrabalho, areaTrabalho)
	VALUES (idEdital, titulo, palavraChave1, palavraChave2, palavraChave3, palavraChave4, palavraChave5, idiomaPrincipal, idioma2, idioma3, descricao, status, tipoTrabalho, areaTrabalho);
	commit;
end;$$;

-- Atualização da tabela Trabalho
create or replace procedure UpdateTrabalho (
    idEdital SERIAL, -- deixei sem esse por enquanto pq fiquei em dúvida se precisaria atualizar o edital, mas talvez sim? caso tenham colocado errado?
    idTrabalho INTEGER,
    titulo VARCHAR(64),
    palavraChave1 VARCHAR(16),
    palavraChave2 VARCHAR(16),
    palavraChave3 VARCHAR(16),
    palavraChave4 VARCHAR(16),
    palavraChave5 VARCHAR(16),
    idiomaPrincipal CHAR,
    idioma2 CHAR,
    idioma3 CHAR,
    descricao VARCHAR(200),
    status VARCHAR(16),
    tipoTrabalho VARCHAR(32),
    areaTrabalho INTEGER
)
language plpgsql
as $$
begin
	UPDATE Trabalho
	SET idEdital = idEdital AND
        titulo = titulo AND 
        palavraChave1 = palavraChave1 AND 
        palavraChave2 = palavraChave2 AND
        palavraChave3 = palavraChave3 AND
        palavraChave4 = palavraChave4 AND
        palavraChave5 = palavraChave5 AND
        idiomaPrincipal = idiomaPrincipal AND
        idioma2 = idioma2 AND
        idioma3 = idioma3 AND
        descricao = descricao AND
        status = status AND
        tipoTrabalho = tipoTrabalho AND
        areaTrabalho = areaTrabalho
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$;

-- Inserção na tabela Artigo
create or replace procedure InsertArtigo (
    tipoArtigo VARCHAR(32)
)
language plpgsql
as $$
begin
	INSERT INTO Artigo(tipoArtigo)
	VALUES (tipoArtigo);
	commit;
end;$$;

-- Atualização da tabela Artigo
create or replace procedure UpdateArtigo (
    idTrabalho INTEGER,
    tipoArtigo VARCHAR(32)
)
language plpgsql
as $$
begin
	UPDATE Artigo
	SET tipoArtigo = tipoArtigo
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$;

-- Inserção na tabela VersaoAbstract
create or replace procedure InsertVersaoAbstract (
    idTrabalho INTEGER,
    idioma CHAR,
    texto TEXT,
    ehPrimario BOOLEAN
)
language plpgsql
as $$
begin
	INSERT INTO VersaoAbstract(idTrabalho, idioma, texto, ehPrimario)
	VALUES (idTrabalho, idioma, texto, ehPrimario);
	commit;
end;$$;

-- Atualização da tabela VersaoAbstract
create or replace procedure UpdateVersaoAbstract (
    idTrabalho INTEGER,
    idioma CHAR,
    texto TEXT,
    ehPrimario BOOLEAN
)
language plpgsql
as $$
begin
	UPDATE VersaoAbstract
	SET idioma = idioma AND
        texto = texto AND
        ehPrimario = ehPrimario
    	WHERE idTrabalho = idTrabalho;
	commit;
end;$$;
