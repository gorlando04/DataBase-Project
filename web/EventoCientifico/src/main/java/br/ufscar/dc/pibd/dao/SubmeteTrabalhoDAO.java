package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.math.BigInteger;

import br.ufscar.dc.pibd.domain.SubmeteTrabalho;

public class SubmeteTrabalhoDAO extends GenericDAO{

	public void insert(SubmeteTrabalho submeteTrabalho) {
	
		String sql = "call InsertSubmeteTrabalho(?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, submeteTrabalho.getIdAutor());
            statement.setInt(2, submeteTrabalho.getIdTrabalho());
            statement.setInt(3, submeteTrabalho.getIdAutoria());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public SubmeteTrabalho get(int idAutor) {
		SubmeteTrabalho submeteTrabalho = null;

        /*
        String sql = "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";
        */

        String sql = "SELECT * from SubmeteTrabalho, Autor, Trabalho where SubmeteTrabalho.idAutoria = ? and SubmeteTrabalho.idAutor = Autor.idAutor and SubmeteTrabalho.idTrabalho = Trabalho.idTrabalho";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setInt(1, idAutor);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int idTrabalho = resultSet.getInt("idTrabalho");
                int idAutoria = resultSet.getInt("idAutoria");

                // precisa do id aqui?
                submeteTrabalho = new SubmeteTrabalho(idTrabalho, idAutoria);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return submeteTrabalho;
    }
	
	public List<SubmeteTrabalho> getAll() {

        List<SubmeteTrabalho> listaSubmeteTrabalho = new ArrayList<>();

        // também tem que ver esse select aqui
        //String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        String sql = "SELECT * from SubmeteTrabalho, Autor, Trabalho where SubmeteTrabalho.idAutor = Autor.idAutor and SubmeteTrabalho.idTrabalho = Trabalho.idTrabalho";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                int idTrabalho = resultSet.getInt("idTrabalho");
                int idAutoria = resultSet.getInt("idAutoria");

                // precisa do id aqui?
                SubmeteTrabalho submeteTrabalho = new SubmeteTrabalho(idTrabalho, idAutoria);
                listaSubmeteTrabalho.add(submeteTrabalho);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaSubmeteTrabalho;
    }
}
