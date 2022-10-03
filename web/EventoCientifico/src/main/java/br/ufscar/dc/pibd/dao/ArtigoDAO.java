package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Artigo;

public class ArtigoDAO extends GenericDAO{
    
    public void insert(Artigo artigo) {
	
		String sql = "call InsertArtigo(?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, artigo.getTipoArtigo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Artigo get(Long idTrabalho){
        Artigo artigo = null;

        String sql = "SELECT * From Artigo WHERE idTrabalho=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idTrabalho);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String tipoArtigo = resultSet.getString("tipoArtigo");

                artigo = new Artigo(idTrabalho, tipoArtigo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return artigo;
    }

    public List<Artigo> getAll(){
        List<Artigo> listaArtigos = new ArrayList<>();
        String sql = "SELECT * From Artigo";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idTrabalho = resultSet.getLong("idTrabalho");
                String tipoArtigo = resultSet.getString("tipoArtigo");
            

                Artigo artigo = new Artigo(idTrabalho, tipoArtigo);
                listaArtigos.add(artigo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaArtigos;
    }

    public void update(Artigo artigo){

        String sql = "call UpdateArtigo(?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, artigo.getIdTrabalho());
            statement.setString(1, artigo.getTipoArtigo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
