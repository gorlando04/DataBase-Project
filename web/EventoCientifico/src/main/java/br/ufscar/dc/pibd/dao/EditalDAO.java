package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Edital;

public class EditalDAO extends GenericDAO{
    
    public void insert(Edital edital) {
	
		String sql = "call InsertEdital(?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, edital.getId());
            statement.setString(1, edital.getSigla());
            statement.setString(2, edital.getUrl());
            statement.setDate(3, edital.getDataUltimaEdicao());
            statement.setDate(4, edital.getDataPublicacaoOriginal());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Edital get(Long id){
        Edital edital = null;

        String sql = "SELECT * From Edital WHERE id=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String sigla = resultSet.getString("sigla");
                String url = resultSet.getString("url");
                Date dataUltimaEdicao = resultSet.getDate("dataUltimaEdicao");
                Date dataPublicacaoOriginal = resultSet.getDate("dataPublicacaoOriginal");

                edital = new Edital(id, sigla, url, dataUltimaEdicao, dataPublicacaoOriginal);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return edital;
    }

    public List<Edital> getAll(){
        List<Edital> listaEditais = new ArrayList<>();
        String sql = "SELECT * From Edital";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String sigla = resultSet.getString("sigla");
                String url = resultSet.getString("url");
                Date dataUltimaEdicao = resultSet.getDate("dataUltimaEdicao");
                Date dataPublicacaoOriginal = resultSet.getDate("dataPublicacaoOriginal");

                Edital edital = new Edital(id, sigla, url, dataUltimaEdicao, dataPublicacaoOriginal);
                listaEditais.add(edital);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEditais;
    }

    public void update(Edital edital){

        String sql = "call UpdateEdital(?, ?, ?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, edital.getId());
            statement.setString(1, edital.getSigla());
            statement.setString(2, edital.getUrl());
            statement.setDate(3, edital.getDataUltimaEdicao());
            statement.setDate(4, edital.getDataPublicacaoOriginal());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
