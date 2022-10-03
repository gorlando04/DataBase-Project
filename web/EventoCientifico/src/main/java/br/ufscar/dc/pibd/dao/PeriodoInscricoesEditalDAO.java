package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.PeriodoInscricoesEdital;

public class PeriodoInscricoesEditalDAO extends GenericDAO{
    
    public void insert(PeriodoInscricoesEdital PeriodoInscricoesEdital) {
	
		String sql = "call InsertPeriodoInscricoesEdital(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, PeriodoInscricoesEdital.getIdCronogramaEdital());
            statement.setDate(1, PeriodoInscricoesEdital.getInicioPeriodoI());
            statement.setDate(2, PeriodoInscricoesEdital.getFimPeriodoI());
   
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PeriodoInscricoesEdital get(Long idCronogramaEdital){
        PeriodoInscricoesEdital periodoInscricoesEdital = null;

        String sql = "SELECT * From PeriodoInscricoesEdital WHERE idCronogramaEdital=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idCronogramaEdital);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Date fimPeriodoI = resultSet.getDate("fimPeriodoI");
                Date inicioPeriodoI = resultSet.getDate("inicioPeriodoI");

                periodoInscricoesEdital = new PeriodoInscricoesEdital(idCronogramaEdital, inicioPeriodoI, fimPeriodoI);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return periodoInscricoesEdital;
    }

    public List<PeriodoInscricoesEdital> getAll(){
        List<PeriodoInscricoesEdital> listaPeriodoInscricoesEdital = new ArrayList<>();
        String sql = "SELECT * From PeriodoInscricoesEdital";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idCronogramaEdital = resultSet.getLong("idCronogramaEdital");
                Date fimPeriodoI = resultSet.getDate("fimPeriodoI");
                Date inicioPeriodoI = resultSet.getDate("inicioPeriodoI");

                PeriodoInscricoesEdital PeriodoInscricoesEdital = new PeriodoInscricoesEdital(idCronogramaEdital,  inicioPeriodoI, fimPeriodoI);
                listaPeriodoInscricoesEdital.add(PeriodoInscricoesEdital);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPeriodoInscricoesEdital;
    }

    public void update(PeriodoInscricoesEdital PeriodoInscricoesEdital){

        String sql = "call UpdatePeriodoInscricoesEdital(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, PeriodoInscricoesEdital.getIdCronogramaEdital());
            statement.setDate(1, PeriodoInscricoesEdital.getInicioPeriodoI());
            statement.setDate(2, PeriodoInscricoesEdital.getFimPeriodoI());

            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
