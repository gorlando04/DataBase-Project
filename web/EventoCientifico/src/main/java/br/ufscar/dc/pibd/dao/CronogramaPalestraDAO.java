package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;


import br.ufscar.dc.pibd.domain.CronogramaPalestra;

public class CronogramaPalestraDAO extends GenericDAO{

	public void insert(CronogramaPalestra cronogramaPalestra) {
	
		String sql = "call InsertCronogramaPalestra(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, cronogramaPalestra.getIdAbordagem());
            statement.setInt(2, cronogramaPalestra.getIdPalestra());
            statement.setString(3, cronogramaPalestra.getTipoEvento());
            statement.setDate(4, (Date) cronogramaPalestra.getDataDaPalestra());
            statement.setTime(5, cronogramaPalestra.getHoraDaPalestra());
            statement.setString(6, cronogramaPalestra.getDuracaoPrevista());
            statement.setInt(7, cronogramaPalestra.getNumeroDeSala());
            statement.setString(8, cronogramaPalestra.getPredio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public CronogramaPalestra get(int idAbordagem) {
		CronogramaPalestra cronogramaPalestra = null;

        /*
        String sql = "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";
        */

        String sql = "SELECT * from CronogramaPalestra, Palestras, Abordagem where Cronograma.IdAbordagem = ? and Cronograma.IdAbordagem = Palestras.idAbordagem and Cronograma.IdAbordagem = Abordagem.IdAbordagem";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setInt(1, idAbordagem);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String tipoEvento = resultSet.getString("tipoEvento");
                Date dataDaPalestra = resultSet.getDate("dataDaPalestra");
                Time horaDaPalestra = resultSet.getTime("horaDaPalestra");
                String duracaoPrevista = resultSet.getString("duracaoPrevista");
                int numeroDeSala = resultSet.getInt("numeroDeSala");
                String predio = resultSet.getString("predio");

                // precisa do id aqui?
                cronogramaPalestra = new CronogramaPalestra(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cronogramaPalestra;
    }
	
	public List<CronogramaPalestra> getAll() {

        List<CronogramaPalestra> listaCronogramaPalestra = new ArrayList<>();

        // também tem que ver esse select aqui
        //String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        String sql = "SELECT * from CronogramaPalestra, Palestras, where Cronograma.IdAbordagem = Palestras.idAbordagem";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {

                String tipoEvento = resultSet.getString("tipoEvento");
                Date dataDaPalestra = resultSet.getDate("dataDaPalestra");
                Time horaDaPalestra = resultSet.getTime("horaDaPalestra");
                String duracaoPrevista = resultSet.getString("duracaoPrevista");
                int numeroDeSala = resultSet.getInt("numeroDeSala");
                String predio = resultSet.getString("predio");

                // precisa do id aqui?
                CronogramaPalestra cronogramaPalestra = new CronogramaPalestra(tipoEvento, dataDaPalestra, horaDaPalestra, duracaoPrevista, numeroDeSala, predio);

                listaCronogramaPalestra.add(cronogramaPalestra);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCronogramaPalestra;
    }
}
