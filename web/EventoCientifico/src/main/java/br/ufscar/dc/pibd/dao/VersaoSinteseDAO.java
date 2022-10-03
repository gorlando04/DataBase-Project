package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.VersaoSintese;

public class VersaoSinteseDAO extends GenericDAO{
    
    public void insert(VersaoSintese versaoSintese) {
	
		String sql = "call InsertVersaoAbstract(?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, versaoSintese.getIdTrabalho());
            statement.setString(1, versaoSintese.getIdioma());
            statement.setString(2, versaoSintese.getTexto());
            statement.setBoolean(3, versaoSintese.getEhPrimario());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public VersaoSintese get(Long idTrabalho){
        VersaoSintese versao = null;

        String sql = "SELECT * From VersaoAbstract WHERE idTrabalho=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idTrabalho);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String idioma = resultSet.getString("idioma");
                String texto = resultSet.getString("texto");
                boolean ehPrimario = resultSet.getBoolean("ehPrimario");

                versao = new VersaoSintese(idTrabalho, idioma, texto, ehPrimario);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return versao;
    }

    public List<VersaoSintese> getAll(){
        List<VersaoSintese> listaVersoes = new ArrayList<>();
        String sql = "SELECT * From VersaoAbstract";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idTrabalho = resultSet.getLong("idTrabalho");
                String idioma = resultSet.getString("idioma");
                String texto = resultSet.getString("texto");
                boolean ehPrimario = resultSet.getBoolean("ehPrimario");

                VersaoSintese versao = new VersaoSintese(idTrabalho, idioma, texto, ehPrimario);
                listaVersoes.add(versao);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaVersoes;
    }

    public void update(VersaoSintese versaoSintese){

        String sql = "call UpdateVersaoAbstract(?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, versaoSintese.getIdTrabalho());
            statement.setString(1, versaoSintese.getIdioma());
            statement.setString(2, versaoSintese.getTexto());
            statement.setBoolean(3, versaoSintese.getEhPrimario());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
