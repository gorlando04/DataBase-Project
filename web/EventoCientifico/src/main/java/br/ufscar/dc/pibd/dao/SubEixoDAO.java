package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.SubEixo;

public class SubEixoDAO extends GenericDAO{
    public void insert(SubEixo subEixo){
        String sql = "call InsertSubEixosApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, subEixo.getIdEixo());
            statement.setString(1, subEixo.getnomeSubEixo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public SubEixo get(Long idEixo){
        SubEixo SubEixo = null;

        String sql = "SELECT * From SubEixosApresentacao WHERE idEixo=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idEixo);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String nomeSubEixo = resultSet.getString("nomeSubEixo");

                SubEixo = new SubEixo(idEixo, nomeSubEixo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return SubEixo;
    }
    public List<SubEixo> getAll(){
        List<SubEixo> listaSubEixos = new ArrayList<>();
        String sql = "SELECT * From SubEixosApresentacao";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idEixo = resultSet.getLong("idEixo");
                String nomeSubEixo = resultSet.getString("nomeSubEixo");

                SubEixo SubEixo = new SubEixo(idEixo, nomeSubEixo);
                listaSubEixos.add(SubEixo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaSubEixos;
    }
    public void update(SubEixo SubEixo){
        String sql = "call UpdateSubEixosApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, SubEixo.getIdEixo());
            statement.setString(2, SubEixo.getnomeSubEixo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
