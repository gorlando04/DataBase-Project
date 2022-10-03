package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.FormatoCitacao;

public class FormatoCitacaoDAO extends GenericDAO{
    
    public void insert(FormatoCitacao formatoCitacao) {
	
		String sql = "INSERT INTO FormatosCitacao (idAutor, forma) VALUES (?,?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, formatoCitacao.getIdAutor());
            statement.setString(1, formatoCitacao.getForma());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public FormatoCitacao get(Long idAutor){
        FormatoCitacao formato = null;

        String sql = "SELECT * From FormatosCitacao WHERE idAutor=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idAutor);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String forma = resultSet.getString("forma");

                formato = new FormatoCitacao(idAutor, forma);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return formato;
    }

    public List<FormatoCitacao> getAll(){
        List<FormatoCitacao> listaFormatos = new ArrayList<>();
        String sql = "SELECT * From FormatosCitacao";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idAutor = resultSet.getLong("idAutor");
                String forma = resultSet.getString("forma");

                FormatoCitacao formato = new FormatoCitacao(idAutor, forma);
                listaFormatos.add(formato);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaFormatos;
    }

    public void update(FormatoCitacao formatoCitacao){

        String sql = "UPDATE FormatosCitacao SET forma=? WHERE idAutor=?";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, formatoCitacao.getForma());
            statement.setLong(1, formatoCitacao.getIdAutor());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
