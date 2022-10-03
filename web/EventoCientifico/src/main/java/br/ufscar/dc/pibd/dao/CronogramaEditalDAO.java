package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.CronogramaEdital;

public class CronogramaEditalDAO extends GenericDAO{
    
    public void insert(CronogramaEdital CronogramaEdital) {
	
		String sql = "call InsertCronogramaEdital(?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, CronogramaEdital.getIdEdital());
            statement.setDate(1, CronogramaEdital.getDataPublicacaoOriginal());
            statement.setString(2, CronogramaEdital.getIntervaloRealizacao());
            statement.setDate(3, CronogramaEdital.getDataDivulgacaoListaAprovados());
   
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public CronogramaEdital get(Long idCronogramaEdital){
        CronogramaEdital cronogramaEdital = null;

        String sql = "SELECT * From CronogramaEdital WHERE idCronogramaEdital=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idCronogramaEdital);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String intervaloRealizacao = resultSet.getString("intervaloRealizacao");
                Date dataDivulgacaoListaAprovados = resultSet.getDate("dataDivulgacaoListaAprovados");
                Date dataPublicacaoOriginal = resultSet.getDate("dataPublicacaoOriginal");

                cronogramaEdital = new CronogramaEdital(idCronogramaEdital, idEdital, dataPublicacaoOriginal, intervaloRealizacao, dataDivulgacaoListaAprovados);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cronogramaEdital;
    }

    public List<CronogramaEdital> getAll(){
        List<CronogramaEdital> listaCronogramaEdital = new ArrayList<>();
        String sql = "SELECT * From CronogramaEdital";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idCronogramaEdital = resultSet.getLong("idCronogramaEdital");
                Long idEdital = resultSet.getLong("idEdital");
                String intervaloRealizacao = resultSet.getString("intervaloRealizacao");
                Date dataDivulgacaoListaAprovados = resultSet.getDate("dataDivulgacaoListaAprovados");
                Date dataPublicacaoOriginal = resultSet.getDate("dataPublicacaoOriginal");

                CronogramaEdital cronogramaEdital = new CronogramaEdital(idCronogramaEdital, idEdital, dataPublicacaoOriginal, intervaloRealizacao, dataDivulgacaoListaAprovados);
                listaCronogramaEdital.add(cronogramaEdital);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCronogramaEdital;
    }

    public void update(CronogramaEdital CronogramaEdital){

        String sql = "call UpdateCronogramaEdital(?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, CronogramaEdital.getIdCronogramaEdital());
            statement.setLong(1, CronogramaEdital.getIdEdital());
            statement.setDate(2, CronogramaEdital.getDataPublicacaoOriginal());
            statement.setString(3, CronogramaEdital.getIntervaloRealizacao());
            statement.setDate(4, CronogramaEdital.getDataDivulgacaoListaAprovados());

            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
