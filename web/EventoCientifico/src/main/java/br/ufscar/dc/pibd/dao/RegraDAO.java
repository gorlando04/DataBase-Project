package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Regra;

public class RegraDAO extends GenericDAO{
    public void insert(Regra regra){
        String sql = "call InsertRegras(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, regra.getIdEdital());
            statement.setString(1, regra.getDescricao());
            statement.setBytes(2, regra.getModelo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Regra get(Long idEdital){
        Regra regra = null;

        String sql = "SELECT * From Regras WHERE idEdital=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idEdital);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String descricao = resultSet.getString("descricao");
                byte[] modelo = resultSet.getBytes("modelo");

                regra = new Regra(idEdital, descricao, modelo);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return regra;
    }
    public List<Regra> getAll(){
        List<Regra> listaRegras = new ArrayList<>();
        String sql = "SELECT * From Regras";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String descricao = resultSet.getString("descricao");
                byte[] modelo = resultSet.getBytes("modelo");

                Regra regra = new Regra(idEdital, descricao, modelo);
                listaRegras.add(regra);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaRegras;
    }
    public void update(Regra regra){
        String sql = "call UpdateRegras(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, regra.getIdEdital());
            statement.setString(1, regra.getDescricao());
            statement.setBytes(2, regra.getModelo());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
