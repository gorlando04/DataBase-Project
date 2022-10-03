package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Eixo;

public class EixoDAO extends GenericDAO{
    public void insert(Eixo eixo){
        String sql = "call InsertEixosApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, eixo.getIdEixo());
            statement.setLong(1, eixo.getIdEdital());
            statement.setString(2, eixo.getNomeEixo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Eixo get(Long idEixo){
        Eixo eixo = null;

        String sql = "SELECT * From EixosApresentacao WHERE idEixo=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idEixo);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String nomeEixo = resultSet.getString("nomeEixo");

                eixo = new Eixo(idEixo, idEdital, nomeEixo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return eixo;
    }
    public List<Eixo> getAll(){
        List<Eixo> listaEixos = new ArrayList<>();
        String sql = "SELECT * From EixosApresentacao";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idEixo = resultSet.getLong("idEixo");
                Long idEdital = resultSet.getLong("idEdital");
                String nomeEixo = resultSet.getString("nomeEixo");

                Eixo eixo = new Eixo(idEixo, idEdital, nomeEixo);
                listaEixos.add(eixo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEixos;
    }
    public void update(Eixo eixo){
        String sql = "call UpdateEixosApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, eixo.getIdEixo());
            statement.setLong(1, eixo.getIdEdital());
            statement.setString(2, eixo.getNomeEixo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
