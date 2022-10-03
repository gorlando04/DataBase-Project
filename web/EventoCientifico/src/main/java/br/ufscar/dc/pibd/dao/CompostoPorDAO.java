package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.CompostoPor;

public class CompostoPorDAO extends GenericDAO {

    public void insert(CompostoPor cp){
        String sql = "call InsertCompostoPor(?, ?, ?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, cp.getIdPessoa());
            statement.setLong(2, cp.getIdComite());
            statement.setString(3, cp.getEhResponsavel());
            statement.setString(4, cp.getEhCorresponsavel());

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public CompostoPor get(Long id){
        CompostoPor cp = null;

        String sql = "SELECT * FROM CompostoPor WHERE idCompostoPor = ?";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                Long idPessoa = resultSet.getLong("idPessoa");
                Long idComite = resultSet.getLong("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");

                cp = new CompostoPor(id, idPessoa, idComite, ehCorresponsavel, ehResponsavel);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return cp;
    }

    public List<CompostoPor> getAll(){
        List<CompostoPor> listaCm = new ArrayList<>();
        String sql = "SELECT * FROM CompostoPor";

        try{
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                Long idCompostoPor = resultSet.getLong("idCompostoPor");
                Long idPessoa = resultSet.getLong("idPessoa");
                Long idComite = resultSet.getLong("idComite");
                String ehResponsavel = resultSet.getString("ehResponsavel");
                String ehCorresponsavel = resultSet.getString("ehCorresponsavel");

                CompostoPor cp = new CompostoPor(idCompostoPor, idPessoa, idComite, ehCorresponsavel, ehResponsavel);
                listaCm.add(cp);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e ){
            throw new RuntimeException(e);
        }
        return listaCm;
    }

    public void update(CompostoPor cp){
        String sql = "call UpdateCompostoPor(?, ?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, cp.getIdComite());
            statement.setString(2, cp.getEhResponsavel());
            statement.setString(3, cp.getEhCorresponsavel());
            statement.executeUpdate();

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

}
