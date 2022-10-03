package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.ComissaoOrganizadora;

public class ComissaoOrganizadoraDAO extends GenericDAO {

    public void insert(ComissaoOrganizadora cm){
        String sql = "call InsertComissaoOrganizadora(?, ?, ?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cm.getEdicao());
            statement.setString(2, cm.getSigla());
            statement.setInt(3, cm.getAno());
            statement.setString(4, cm.getPais());

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ComissaoOrganizadora get(String edicao, String sigla){
        ComissaoOrganizadora cm = null;

        String sql = "SELECT * FROM ComissaoOrganizadora WHERE edicao = ? AND sigla = ?";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, edicao);
            statement.setString(2, sigla);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                int ano = resultSet.getInt("ano");
                String pais = resultSet.getString("pais");

                cm = new ComissaoOrganizadora(edicao, sigla, ano, pais);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
        return cm;
    }

    public List<ComissaoOrganizadora> getAll(){
        List<ComissaoOrganizadora> listaCm = new ArrayList<>();
        String sql = "SELECT * FROM ComissaoOrganizadora";

        try{
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while(resultSet.next()){
                String edicao = resultSet.getString("edicao");
                String sigla = resultSet.getString("sigla");
                int ano = resultSet.getInt("ano");
                String pais = resultSet.getString("pais");

                ComissaoOrganizadora cm = new ComissaoOrganizadora(edicao, sigla, ano, pais);
                listaCm.add(cm);
            }
            resultSet.close();
            statement.close();
            conn.close();
        }catch(SQLException e ){
            throw new RuntimeException(e);
        }
        return listaCm;
    }

    public void update(ComissaoOrganizadora cm){
        String sql = "call UpdateComissaoOrganizadora(?, ?, ?, ?)";

        try{
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setString(1, cm.getEdicao());
            statement.setString(2, cm.getSigla());
            statement.setInt(3, cm.getAno());
            statement.setString(4, cm.getPais());
            statement.executeUpdate();

            statement.close();
            conn.close();
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

}
