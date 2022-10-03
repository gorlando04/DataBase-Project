-- Trigger t_before_ins_row_avaliador para verificar data de aceite do convite
create or replace function BeforeInsertAvaliador()
returns trigger as $$
declare
	prazoRespConv refcursor;
	dataPrazoEncontrado timestamp;
    prazoAdicional interval;
begin
    open prazoRespConv for select dataEnvioConv + prazoRespConv from PrazoRespostaAvaliador where PrazoRespostaAvaliador.dataEnvioConv = new.dataEnvioConv;
	fetch prazoRespConv into dataPrazoEncontrado;
	close prazoRespConv;
    
    if dataPrazoEncontrado >= new.dataRespConv then
        raise notice 'Convite aceito';
        return NEW;
    end if;

    prazoAdicional := '1 day';
    select dataPrazoEncontrado + prazo into dataPrazoEncontrado;

    if dataPrazoEncontrado >= new.dataRespConv then
        raise notice 'Resposta está atrasada em menos de 1 dia, portanto o convite será aceito';
    	return NEW;
	end if;
    raise 'Resposta do convite está atrasada em mais de 1 dia, logo a resposta será recusada';
	return NEW;

end; 
$$
language plpgsql;

create or replace trigger t_before_ins_row_avaliador
before insert or update
on Avaliador
for each row execute function BeforeInsertAvaliador();
--------------------------------------------------------------------------------

