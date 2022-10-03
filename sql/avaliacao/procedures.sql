------------------------Para inserir avaliacoes---------------------
--InsertAvalia
create or replace procedure InsertAvalia(
    OUT idAvaliaN integer,
    idTrabalhoN INTEGER,
    idAvaliadorN INTEGER
)
language plpgsql
as $$
declare
	idRecup integer := 0;
	cursorIdAv refcursor;
begin
    open cursorIdAv for INSERT INTO Avalia(idTrabalhoN, idAvaliadorN) VALUES (idTrabalho, idAvaliador) returning idAvalia;
    fetch cursorIdAv into idRecup;
    close cursorIdAv;
    select idRecup into idAvaliaN;
end $$;

-- InsertCriterioAvaliacao
create or replace procedure InsertCriterioAvaliacao(
  idEditalN INTEGER,  
  criterioAvaliadoN varchar(100),
  descricaoCriterioN varchar(500)
)
language plpgsql
as $$
begin
    INSERT INTO CriterioAvaliacao(idEdital, criterioAvaliado, descricaoCriterio) VALUES (idEditalN, criterioAvaliadoN, descricaoCriterioN);
end $$;

-- InsertPrazoAvaliacao
create or replace procedure InsertPrazoAvaliacao(
    OUT dataAtribuicao TIMESTAMP,
    prazo INTERVAL
)
language plpgsql
as $$
begin
    INSERT INTO PrazoAvaliacao(dataAtribuicao, prazo) VALUES (current_timestamp, prazoN);
end $$;

-- InsertAvaliacao
create or replace procedure InsertAvaliacao(
   -- idAvalia integer,
    idCriterioAvaliado integer,
    dataAtribuicao TIMESTAMP,
    conflito boolean,
    dataResposta date,
    justificativa varchar(500),
    notaAtribuida real
)
language plpgsql
as $$
    cursorIdAvalia refcursor;
begin
    
    INSERT INTO Avaliacao(idAvalia, idCriterioAvaliado, dataAtribuicao, conflito, dataResposta, justificativa, notaAtribuida) VALUES (idAvalia, idCriterioAvaliado, dataAtribuicao, conflito, dataResposta, justificativa, notaAtribuida);
end $$;

