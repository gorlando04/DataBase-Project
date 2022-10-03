package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.SubArea;

public class SubAreaDAO extends GenericDAO{
    public void insert(SubArea subArea){
        String sql = "call InsertSubAreasApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, subArea.getIdArea());
            statement.setString(1, subArea.getnomeSubArea());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public SubArea get(Long idArea){
        SubArea SubArea = null;

        String sql = "SELECT * From SubAreasApresentacao WHERE idArea=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idArea);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String nomeSubArea = resultSet.getString("nomeSubArea");

                SubArea = new SubArea(idArea, nomeSubArea);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return SubArea;
    }
    public List<SubArea> getAll(){
        List<SubArea> listaSubAreas = new ArrayList<>();
        String sql = "SELECT * From SubAreasApresentacao";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idArea = resultSet.getLong("idArea");
                String nomeSubArea = resultSet.getString("nomeSubArea");

                SubArea SubArea = new SubArea(idArea, nomeSubArea);
                listaSubAreas.add(SubArea);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaSubAreas;
    }
    public void update(SubArea SubArea){
        String sql = "call UpdateSubAreasApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, SubArea.getIdArea());
            statement.setString(2, SubArea.getnomeSubArea());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
