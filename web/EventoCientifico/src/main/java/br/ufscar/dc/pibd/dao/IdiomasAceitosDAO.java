package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.IdiomasAceitos;

public class IdiomasAceitosDAO extends GenericDAO {
    public void insert(IdiomasAceitos idioma){
        String sql = "call InsertIdiomasAceitos(?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(0, idioma.getIdEdital());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public IdiomasAceitos get(Long idEdital){
        IdiomasAceitos idioma = null;

        String sql = "SELECT * From IdiomasAceitos WHERE idEdital=?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, idEdital);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String nomeIdioma = resultSet.getString("idioma");

                idioma = new IdiomasAceitos(nomeIdioma,idEdital);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idioma;
    }
    public List<IdiomasAceitos> getAll(){
        List<IdiomasAceitos> listaIdiomas = new ArrayList<>();
        String sql = "SELECT * From IdiomasAceitos";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Long idEdital = resultSet.getLong("idEdital");
                String nomeIdioma = resultSet.getString("idioma");

                IdiomasAceitos idioma = new IdiomasAceitos(nomeIdioma, idEdital);
                listaIdiomas.add(idioma);
            }

            resultSet.close();
            statement.close();
            conn.close();
        }catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaIdiomas;
    }
    public void update(IdiomasAceitos idioma, String novoIdioma){
        String sql = "call UpdateIdiomasAceitos(?, ?, ?)";

        try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(0, idioma.getIdioma());
            statement.setString(1, novoIdioma);
            statement.setLong(2, idioma.getIdEdital());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch(SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
