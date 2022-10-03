package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.PeriodoSubmissoesEdital;

public class PeriodoSubmissoesEditalDAO extends GenericDAO{
    
    public void insert(PeriodoSubmissoesEdital PeriodoSubmissoesEdital) {
	
		String sql = "call InsertPeriodoSubmissoesEdital(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, PeriodoSubmissoesEdital.getIdCronogramaEdital());
            statement.setDate(1, PeriodoSubmissoesEdital.getinicioPeriodoS());
            statement.setDate(2, PeriodoSubmissoesEdital.getfimPeriodoS());
   
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PeriodoSubmissoesEdital get(Long idCronogramaEdital){
        PeriodoSubmissoesEdital periodoSubmissoesEdital = null;

        String sql = "SELECT * From PeriodoSubmissoesEdital WHERE idCronogramaEdital=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idCronogramaEdital);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Date fimPeriodoS = resultSet.getDate("fimPeriodoS");
                Date inicioPeriodoS = resultSet.getDate("inicioPeriodoS");

                periodoSubmissoesEdital = new PeriodoSubmissoesEdital(idCronogramaEdital, inicioPeriodoS, fimPeriodoS);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return periodoSubmissoesEdital;
    }

    public List<PeriodoSubmissoesEdital> getAll(){
        List<PeriodoSubmissoesEdital> listaPeriodoSubmissoesEdital = new ArrayList<>();
        String sql = "SELECT * From PeriodoSubmissoesEdital";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idCronogramaEdital = resultSet.getLong("idCronogramaEdital");
                Date fimPeriodoS = resultSet.getDate("fimPeriodoS");
                Date inicioPeriodoS = resultSet.getDate("inicioPeriodoS");

                PeriodoSubmissoesEdital PeriodoSubmissoesEdital = new PeriodoSubmissoesEdital(idCronogramaEdital,  inicioPeriodoS, fimPeriodoS);
                listaPeriodoSubmissoesEdital.add(PeriodoSubmissoesEdital);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPeriodoSubmissoesEdital;
    }

    public void update(PeriodoSubmissoesEdital PeriodoSubmissoesEdital){

        String sql = "call UpdatePeriodoSubmissoesEdital(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, PeriodoSubmissoesEdital.getIdCronogramaEdital());
            statement.setDate(1, PeriodoSubmissoesEdital.getinicioPeriodoS());
            statement.setDate(2, PeriodoSubmissoesEdital.getfimPeriodoS());

            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
