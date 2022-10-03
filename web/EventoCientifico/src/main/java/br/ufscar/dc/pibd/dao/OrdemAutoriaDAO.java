package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.math.BigInteger;

import br.ufscar.dc.pibd.domain.OrdemAutoria;

public class OrdemAutoriaDAO extends GenericDAO{

	public void insert(OrdemAutoria ordemAutoria) {
	
		String sql = "call InsertOrdemAutoria(?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, ordemAutoria.getIdAutor());
            statement.setInt(2, ordemAutoria.getOrdemAutor());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public OrdemAutoria get(int idAutor) {
		OrdemAutoria ordemAutoria = null;

        /*
        String sql = "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";
        */

        String sql = "SELECT * from OrdemAutoria, Autor where OrdemAutoria.idAutoria = ? and OrdemAutoria.idAutor = Autor.idAutor";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setInt(1, idAutor);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int ordemAutor = resultSet.getInt("ordemAutor");

                // precisa do id aqui?
                ordemAutoria = new OrdemAutoria(ordemAutor);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ordemAutoria;
    }
	
	public List<OrdemAutoria> getAll() {

        List<OrdemAutoria> listaOrdemAutoria = new ArrayList<>();

        // também tem que ver esse select aqui
        //String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        String sql = "SELECT * from OrdemAutoria, Autor where OrdemAutoria.idAutor = Autor.idAutor";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {

                int ordemAutor = resultSet.getInt("ordemAutor");

                // precisa do id aqui?
                OrdemAutoria ordemAutoria = new OrdemAutoria(ordemAutor);

                listaOrdemAutoria.add(ordemAutoria);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaOrdemAutoria;
    }
}
