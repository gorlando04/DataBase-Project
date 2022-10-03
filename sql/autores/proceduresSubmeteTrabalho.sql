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
