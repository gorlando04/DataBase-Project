package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.AreasInaptas;

public class AreasInaptasDAO extends GenericDAO {

    public void insert(AreasInaptas areasInaptas){
        String sql = "call InsertAreasInaptas(?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, areasInaptas.getIdAvaliador());
            statement.setString(2, areasInaptas.getAreaInapta());

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
                String areaInapta = resultSet.getString("areaInapta");

                lista.add(areaInapta);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return lista;
    }

    public List<AreasInaptas> getAll(){
        List<AreasInaptas> listaCm = new ArrayList<>();
        String sql = "SELECT * FROM AreasInaptas";

        try{
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                Long idAvaliador = resultSet.getLong("idAvaliador");
                String areaInapta = resultSet.getString("areaInapta");

                AreasInaptas areasInaptas = new AreasInaptas(idAvaliador, areaInapta);
                listaCm.add(areasInaptas);
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
