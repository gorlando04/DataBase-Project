package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Trabalho;

public class TrabalhoDAO extends GenericDAO{
    public void insert(Trabalho trabalho) {
	
		String sql = "call InsertTrabalho(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, trabalho.getIdEdital());
            statement.setString(1, trabalho.getTitulo());
            statement.setString(2, trabalho.getPalavraChave1());
            statement.setString(3, trabalho.getPalavraChave2());
            statement.setString(4, trabalho.getPalavraChave3());
            statement.setString(5, trabalho.getPalavraChave4());
            statement.setString(6, trabalho.getPalavraChave5());
            statement.setString(7, trabalho.getIdiomaPrincipal());
            statement.setString(8, trabalho.getIdioma2());
            statement.setString(9, trabalho.getIdioma3());
            statement.setString(10, trabalho.getDescricao());
            statement.setString(11, trabalho.getStatus());
            statement.setString(12, trabalho.getTipoTrabalho());
            statement.setInt(13, trabalho.getAreaTrabalho());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Trabalho get(Long idTrabalho){
        Trabalho trabalho = null;

        String sql = "SELECT * From Trabalho WHERE idTrabalho=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idTrabalho);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String titulo = resultSet.getString("titulo");
                String palavraChave1 = resultSet.getString("palavraChave1");
                String palavraChave2 = resultSet.getString("palavraChave2");
                String palavraChave3 = resultSet.getString("palavraChave3");
                String palavraChave4 = resultSet.getString("palavraChave4");
                String palavraChave5 = resultSet.getString("palavraChave5");
                String idiomaPrincipal = resultSet.getString("idiomaPrincipal");
                String idioma2 = resultSet.getString("idioma2");
                String idioma3 = resultSet.getString("idioma3");
                String descricao = resultSet.getString("descricao");
                String status = resultSet.getString("status");
                String tipoTrabalho = resultSet.getString("tipoTrabalho");
                int areaTrabalho = resultSet.getInt("areaTrabalho");

                trabalho = new Trabalho(idTrabalho, idEdital, titulo, palavraChave1, palavraChave2, palavraChave3, palavraChave4, palavraChave5, idiomaPrincipal, idioma2, idioma3, descricao, status, tipoTrabalho, areaTrabalho);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return trabalho;
    }

    public List<Trabalho> getAll(){
        List<Trabalho> listaTrabalhos = new ArrayList<>();
        String sql = "SELECT * From Trabalho";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idTrabalho = resultSet.getLong("idTrabalho");
                Long idEdital = resultSet.getLong("idEdital");
                String titulo = resultSet.getString("titulo");
                String palavraChave1 = resultSet.getString("palavraChave1");
                String palavraChave2 = resultSet.getString("palavraChave2");
                String palavraChave3 = resultSet.getString("palavraChave3");
                String palavraChave4 = resultSet.getString("palavraChave4");
                String palavraChave5 = resultSet.getString("palavraChave5");
                String idiomaPrincipal = resultSet.getString("idiomaPrincipal");
                String idioma2 = resultSet.getString("idioma2");
                String idioma3 = resultSet.getString("idioma3");
                String descricao = resultSet.getString("descricao");
                String status = resultSet.getString("status");
                String tipoTrabalho = resultSet.getString("tipoTrabalho");
                int areaTrabalho = resultSet.getInt("areaTrabalho");

                Trabalho trabalho = new Trabalho(idTrabalho, idEdital, titulo, palavraChave1, palavraChave2, palavraChave3, palavraChave4, palavraChave5, idiomaPrincipal, idioma2, idioma3, descricao, status, tipoTrabalho, areaTrabalho);

                listaTrabalhos.add(trabalho);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaTrabalhos;
    }

    public void update(Trabalho trabalho){

        String sql = "call UpdateTrabalho(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, trabalho.getIdEdital());
            statement.setString(1, trabalho.getTitulo());
            statement.setString(2, trabalho.getPalavraChave1());
            statement.setString(3, trabalho.getPalavraChave2());
            statement.setString(4, trabalho.getPalavraChave3());
            statement.setString(5, trabalho.getPalavraChave4());
            statement.setString(6, trabalho.getPalavraChave5());
            statement.setString(7, trabalho.getIdiomaPrincipal());
            statement.setString(8, trabalho.getIdioma2());
            statement.setString(9, trabalho.getIdioma3());
            statement.setString(10, trabalho.getDescricao());
            statement.setString(11, trabalho.getStatus());
            statement.setString(12, trabalho.getTipoTrabalho());
            statement.setInt(13, trabalho.getAreaTrabalho());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
