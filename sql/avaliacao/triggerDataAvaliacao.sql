-- Trigger t_before_ins_row_avaliacao para verificar data da avaliacao ---------
create or replace function BeforeInsertAvaliacao()
returns trigger as $$
declare
	prazoRespAv refcursor;
	dataPrazoEncontrado timestamp;
    prazoAdicional interval;
begin
    open prazoRespAv for select dataAtribuicao + prazo from PrazoAvaliacao where PrazoAvaliacao.dataAtribuicao = new.dataAtribuicao;
	fetch prazoRespAv into dataPrazoEncontrado;
	close prazoRespAv;
    
    if dataPrazoEncontrado >= new.dataAtribuicao then
        raise notice 'Avaliacao aceito';
        return NEW;
    end if;

    prazoAdicional := '1 day';
    select dataPrazoEncontrado + prazo into dataPrazoEncontrado;

    if dataPrazoEncontrado >= new.dataAtribuicao then
        raise notice 'Avaliação está atrasada em menos de 1 dia, portanto a avaliacao será aceita';
    	return NEW;
	end if;
    raise 'Avaliação está atrasada em mais de 1 dia, logo a resposta será recusada';
	return NEW;
end; 
$$
language plpgsql;

create or replace trigger t_before_ins_row_avaliacao
before insert or update
on Avaliacao
for each row execute function BeforeInsertAvaliacao();
