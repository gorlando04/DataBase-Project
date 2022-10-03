package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.PredioPalestra;

public class PredioPalestraDAO extends GenericDAO{
    
    public void insert(PredioPalestra predio) {
	
		String sql = "call InsertPredioPalestra(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(0, predio.getNumeroDeSala());
            statement.setInt(1, predio.getAndar());
            statement.setString(2, predio.getPredio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public PredioPalestra get(int nroSala){
        PredioPalestra predio = null;

        String sql = "SELECT * From PredioPalestra WHERE numeroDeSala=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, nroSala);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int andar = resultSet.getInt("andar");
                String nomePredio = resultSet.getString("predio");

                predio = new PredioPalestra(nroSala, andar, nomePredio);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return predio;
    }

    public List<PredioPalestra> getAll(){
        List<PredioPalestra> listaPredios = new ArrayList<>();
        String sql = "SELECT * From PredioPalestra";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int nroSala = resultSet.getInt("numeroDeSala");
                int andar = resultSet.getInt("andar");
                String nomePredio = resultSet.getString("predio");

                PredioPalestra predio = new PredioPalestra(nroSala, andar, nomePredio);
                listaPredios.add(predio);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPredios;
    }

    public void update(PredioPalestra predio){

        String sql = "call UpdatePredioPalestra(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(0, predio.getNumeroDeSala());
            statement.setInt(1, predio.getAndar());
            statement.setString(2, predio.getPredio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
