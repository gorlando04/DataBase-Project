------------------------Para inserir eventos------------------------

-- essa eh a unica funcao que sera chamada na criacao de um evento, as outras sao todas auxiliares
--InsertEvento
create or replace procedure InsertEvento(
    siglaN varchar(8),
    nomeExtensoN varchar(50),
    paisN varchar(20),
    estadoN varchar(20),
    cidadeN varchar(35),
    bairroN varchar(35),
    cepN varchar(10),
    numeroN integer,
    logradouroN varchar(25),
    complementoN varchar(25)
)
language plpgsql
as $$
declare
    cursorEvento refcursor;
    siglaEvento refcursor;
begin

    call InsertEndereco(cepN, numeroN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN);
    open cursorEvento for select Evento.sigla from Evento where
    Evento.sigla = siglaN;
    fetch cursorEvento into siglaEvento;
    close cursorEvento;
    if not found siglaEvento then 
        INSERT INTO Evento(sigla, nomeExtenso, cep, numero)
        VALUES (siglaN, nomeExtensoN, cepN, numeroN);
    else
        raise notice 'Evento ja cadastrado.';
    end if;
end $$;

--Insert trabalhos aceitos
create or replace procedure InsertTiposTrabalhosAceitosEvento(
    tipoTrabalhoN varchar(20),
    siglaN varchar(8)
)
language plpgsql
as $$
declare
    cursorTrab refcursor;
    trabAceito refcursor;
begin
    open cursorTrab for select * from TiposTrabalhosAceitosEvento
    where TiposTrabalhosAceitosEvento.sigla = siglaN 
    and TiposTrabalhosAceitosEvento.tipoTrabalho = tipoTrabalhoN;
    fetch cursorTrab into trabAceito;
    close cursorTrab;
    if not found trabAceito then
        INSERT INTO TiposTrabalhosAceitosEvento(tipoTrabalho, sigla)
        VALUES (tipoTrabalhoN, siglaN);
    else
        raise notice 'Tipo de trabalho aceito ja cadastrado.';
    end if;
end $$;

------------------------Para inserir eventos------------------------

