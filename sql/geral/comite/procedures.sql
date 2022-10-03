-------------------Para inserir comitês --------------------------

-- Procedure InsertComissaoOrganizadora
create or replace procedure InsertComissaoOrganizadora(
    edicaoN varchar(10),
    siglaN varchar(8),
    anoN integer,
    paisN varchar(20)
)
language plpgsql
as $$
declare
    cursorComissao refcursor;
    comissaoEncont refcursor;
begin
    --PK: edicao e sigla
    INSERT INTO ComissaoOrganizadora(edicao, sigla, ano, pais)
    VALUES (edicaoN, siglaN, anoN, paisN);
end $$;

-- Procedure InsertComite
create or replace procedure InsertComite(
    tipo varchar(20),
    sigla varchar(8),
    descricao varchar(50)
)
language plpgsql
as $$
begin
    INSERT INTO Comite(tipo, sigla, descricao)
    VALUES (tipoN, siglaN, descricaoN);
end $$;

-------------------Para inserir membros----------------------------
--Quando um membro se cadastra, ja se cadastra como membro de um comite, pelo menos, então precisa ser chamado o insertCompostoPor
-- Inserir membro organização brasileiro
create or replace procedure InsertMembroOrganizacaoBrasileiro(
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
    idComiteN integer,
    ehResponsavelN char(3),
    ehCorresponsavelN char(3)
)
language plpgsql
as $$
declare
	idRec integer := 0;
	cursorMembro refcursor;
	membroEncont refcursor;
begin
	
    call InsertBrasileiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN, cpfPessoaN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, idRec);
    open cursorMembro for select * from Brasileiro, MembroOrganizacao 
    where Brasileiro.cpf = cpfPessoaN 
    and Brasileiro.idPessoa = MembroOrganizacao.idPessoa;
    fetch cursorMembro into membroEncont;
    close cursorMembro;
    if not found membroEncont then
        INSERT INTO MembroOrganizacao(idPessoa)
        VALUES (idRec);
        call InsertCompostoPor(idRec, idComiteN, ehResponsavelN, ehCorresponsavelN);
    else
        raise notice 'Membro ja cadastrado.';
    end if;
end $$;

-- Inserir membro organização estrangeiro
create or replace procedure InsertMembroOrganizacaoEstrangeiro(
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
    idComiteN integer,
    ehResponsavelN char(3),
    ehCorresponsavelN char(3)
)
language plpgsql as $$
declare
	idRec integer := 0;
	cursorMembro refcursor;
	membroEncont refcursor;
begin
	open cursorMembro for select * from Estrangeiro, MembroOrganizacao where Estrangeiro.nroPassaporte = nroPassaporteN and 
	Estrangeiro.idPessoa = MembroOrganizacao.idPessoa;
	fetch cursorMembro into membroEncont;
	close cursorMembro;
    call InsertEstrangeiroAtributos(primeiroNomeN, sobrenomeN, cepN, numeroN, filiacaoN, ddiN, dddN, prefixoN, numeroTelefoneN, loginN, dominioN, nroPassaporteN, dataEmissaoN, dataExpiracaoN, govEmissorN, paisN, estadoN, cidadeN, bairroN, logradouroN, complementoN, idRec);
    if not found membroEncont then
        INSERT INTO MembroOrganizacao(idPessoa)
        VALUES (idRec);
        call InsertCompostoPor(idRec, idComiteN, ehResponsavelN, ehCorresponsavelN);
    else
        raise notice 'Membro ja cadastrado.';
    end if;
end $$;

-- Id do comite deve ser passado dos comites que ja tem, pode ser uma lista de comites
-- Procedure InsetCompostoPor
create or replace procedure InsertCompostoPor( 
    idPessoaN integer,
    idComiteN integer,
    ehResponsavelN char(3),
    ehCorresponsavelN char(3)
) 
language plpgsql
as $$
declare 
    cursorComiteConv refcursor;
    comiteConv refcursor;
    idCompostoPorN integer := 0;
    cursorIdComposto refcursor;
begin
    open cursorIdComposto for INSERT INTO CompostoPor(idPessoa, idComite, ehResponsavel, ehCorresponsavel)
    VALUES (idPessoaN, idComiteN, ehResponsavelN, ehCorresponsavelN)
    returning idCompostoPor;
    fetch cursorIdComposto into idCompostoPorN;
    close cursorIdComposto;
    open cursorComiteConv for select * from Comite where Comite.idComite = idComiteN and Comite.tipo = 'CONVITE';
    fetch cursorComiteConv into comiteConv;
    close cursorComiteConv;
    if found comiteConv then
        call InsertMembroComiteConvite(idCompostoPorN);
    end if;
end $$;

create or replace procedure UpdateCompostoPor( 
    idCompostoPor integer,
    ehResponsavelN char(3),
    ehCorresponsavelN char(3)
) 
language plpgsql
as $$
begin
	UPDATE CompostoPor
	SET ehResponsavel = ehResponsavel AND 
        ehCorresponsavel = ehCorresponsavel
    WHERE idCompostoPor = idCompostoPor;
	commit;
end;$$;


------------------------ Membros comitê convite -----------------
-- Quando uma pessoa é membro do comite de convites 
-- esse procedure deve ser chamado
-- Talvez seja bom fazer um trigger pra que quando for feito um insert na tabela compostoPor seja verificador se o membro está sendo cadastrado
--Procedure MembroComite
create or replace procedure InsertMembroComiteConvite(
    idCompostoPor integer
) 
language plpgsql
as $$
begin
    INSERT INTO MembroComiteConvite(idCompostoPor)
    VALUES
    (idCompostoPor);
end $$;
