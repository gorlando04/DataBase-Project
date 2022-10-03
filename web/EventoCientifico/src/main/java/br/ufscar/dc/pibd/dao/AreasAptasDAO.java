package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.AreasAptas;

public class AreasAptasDAO extends GenericDAO {

    public void insert(AreasAptas areasAptas){
        String sql = "call InsertAreasAptas(?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, areasAptas.getIdAvaliador());
            statement.setString(2, areasAptas.getAreaApta());

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public List<String> getAllByAvaliador(Long id){
        List<String> lista = new ArrayList<>();

        String sql = "SELECT * FROM AreasInaptas WHERE idAvaliador = ?";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                String areaApta = resultSet.getString("areaApta");

                lista.add(areaApta);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return lista;
    }

    public List<AreasAptas> getAll(){
        List<AreasAptas> listaCm = new ArrayList<>();
        String sql = "SELECT * FROM AreasAptas";

        try{
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                Long idAvaliador = resultSet.getLong("idAvaliador");
                String areaApta = resultSet.getString("areaApta");

                AreasAptas areasAptas = new AreasAptas(idAvaliador, areaApta);
                listaCm.add(areasAptas);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e ){
            throw new RuntimeException(e);
        }
        return listaCm;
    }


}
