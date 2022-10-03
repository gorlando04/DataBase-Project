-- Trigger para enviar trabalhos para avaliadores aptos
create or replace function AfterSubmeteTrabalho()
returns trigger as $$
declare
	cursorArea refcursor;
	areaEncontrada varchar(20);
	cursorAvaliador refcursor;
	avaliadorUm integer;
	avaliadorDois integer;
	idAvaliaNew integer;
	cursorTrabalho refcursor;
	idAreaR integer;
begin
    open cursorTrabalho for select idArea from Trabalho where Trabalho.idTrabalho = new.idTrabalho;
	fetch cursorTrabalho into idAreaR;
	close cursorTrabalho;
	open cursorArea for select nomeArea from AreasApresentacao where AreasApresentacao.idArea = idAreaR;
	fetch cursorArea into areaEncontrada;
	close cursorArea;
	open cursorAvaliador for select idAvaliador from AreasAptas where AreasAptas.areaApta = areaEncontrada limit 1;
	fetch cursorAvaliador into avaliadorUm;
	close cursorAvaliador;
	if not found avaliadorUm then
		raise 'Não existem avaliadores suficientes';
		return NEW;
	end if;
	call InsertAvalia(idAvaliaNew, new.idTrabalho, avaliadorUm);
	open cursorAvaliador for select idAvaliador from AreasAptas where 
	AreasAptas.areaApta = areaEncontrada 
	and AreasAptas.idAvaliador <> avaliadorUm
	limit 1;
	fetch cursorAvaliador into avaliadorDois;
	close cursorAvaliador;	
	if found avaliadorDois then
		call InsertAvalia(idAvaliaNew, new.idTrabalho, avaliadorDois);
		return NEW;
	end if;
	raise notice 'Apenas um avaliador foi encontrado';
	return NEW;	
end;
$$
language plpgsql;

create or replace trigger t_after_ins_row_submeteTrabalho 
after insert or update
on SubmeteTrabalho
for each row execute function AfterSubmeteTrabalho();

---------------------------------------------------------------- EXEMPLO -------------------------------------------------------------
/*create table Avalia(
	idAvalia serial,
	idAvaliador integer,
	idTrabalho integer,
	constraint idAvalia_pk primary key (idAvalia)
);

create table AreasAptas(
	idAvaliador integer,
	areaApta varchar(20)
);*/

------------------------Para inserir avaliacoes---------------------
--InsertAvalia
/*create or replace procedure InsertAvalia(
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
    open cursorIdAv for INSERT INTO Avalia(idTrabalho, idAvaliador) VALUES (idTrabalhoN, idAvaliadorN) returning idAvalia;
    fetch cursorIdAv into idRecup;
    close cursorIdAv;
    select idRecup into idAvaliaN;
end $$;*/

/*CREATE TABLE IF NOT EXISTS SubmeteTrabalho(
    idAutor INTEGER NOT NULL,
    idTrabalho INTEGER NOT NULL,

    CONSTRAINT submeteTrabalho_pk PRIMARY KEY (idAutor, idTrabalho)
    
);


CREATE TABLE IF NOT EXISTS AreasApresentacao (
    idArea SERIAL,
    nomeArea VARCHAR(20) NOT NULL,

    CONSTRAINT areas_pk PRIMARY KEY (idArea)
);*/

/*insert into AreasAptas(idAvaliador, areaApta) values (1, 'area 1');
insert into AreasAptas(idAvaliador, areaApta) values (2, 'area 1');
insert into AreasAptas(idAvaliador, areaApta) values (3, 'area 2');
insert into AreasAptas(idAvaliador, areaApta) values (4, 'area 3');*/

/*insert into AreasApresentacao (nomeArea) values ('area 1');
insert into AreasApresentacao (nomeArea) values ('area 2');
insert into AreasApresentacao (nomeArea) values ('area 3');*/
/*create table SubmeteTrabalho(
	idTrabalho integer
);*/
--insert into SubmeteTrabalho (idTrabalho) values (1);
/*create table Trabalho(
	idTrabalho integer,
	idArea integer
);*/

/*insert into Trabalho(idTrabalho, idArea) values(1, 1);
insert into Trabalho(idTrabalho, idArea) values(2, 2);
insert into Trabalho(idTrabalho, idArea) values(3, 3);
insert into Trabalho(idTrabalho, idArea) values(4, 4);*/
--insert into SubmeteTrabalho (idTrabalho) values (4);
--select * from Avalia;
-- Trigger para enviar trabalhos para avaliadores aptos

