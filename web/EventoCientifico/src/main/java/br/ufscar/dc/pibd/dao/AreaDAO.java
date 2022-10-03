package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Area;

public class AreaDAO extends GenericDAO{
    public void insert(Area Area){
        String sql = "call InsertAreasApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, Area.getIdArea());
            statement.setLong(1, Area.getIdEdital());
            statement.setString(2, Area.getNomeArea());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Area get(Long idArea){
        Area Area = null;

        String sql = "SELECT * From AreasApresentacao WHERE idArea=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idArea);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String nomeArea = resultSet.getString("nomeArea");

                Area = new Area(idArea, idEdital, nomeArea);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Area;
    }
    public List<Area> getAll(){
        List<Area> listaAreas = new ArrayList<>();
        String sql = "SELECT * From AreasApresentacao";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idArea = resultSet.getLong("idArea");
                Long idEdital = resultSet.getLong("idEdital");
                String nomeArea = resultSet.getString("nomeArea");

                Area Area = new Area(idArea, idEdital, nomeArea);
                listaAreas.add(Area);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaAreas;
    }
    public void update(Area Area){
        String sql = "call UpdateAreasApresentacao(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, Area.getIdArea());
            statement.setLong(1, Area.getIdEdital());
            statement.setString(2, Area.getNomeArea());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
