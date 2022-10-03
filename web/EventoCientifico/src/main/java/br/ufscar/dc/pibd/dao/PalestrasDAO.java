package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.math.BigInteger;

import br.ufscar.dc.pibd.domain.Palestras;

public class PalestrasDAO extends GenericDAO{

	public void insert(Palestras palestras) {
	
		String sql = "call InsertPalestras(?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, palestras.getIdAbordagem());
            statement.setString(2, palestras.getTituloDaPalestra());
            statement.setString(3, palestras.getResumoDaPalestra());
            statement.setString(4, palestras.getMaterialDeApoio());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public Palestras get(int idAbordagem) {
		Palestras palestras = null;

        /*
        String sql = "SELECT * from Autor, Pessoa, Brasileiro where Brasileiro.cpf = ? and Brasileiro.idPessoa = Pessoa.idPessoa and Autor.idAutor = Pessoa.idPessoa";
        */

        String sql = "SELECT * from Palestras, Abordagem where Palestras.idPalestra = ? and Palestras.idPalestra = Abordagem.idAbordagem";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setInt(1, idAbordagem);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String tituloDaPalestra = resultSet.getString("tituloDaPalestra");
                String resumoDaPalestra = resultSet.getString("resumoDaPalestra");
                String materialDeApoio = resultSet.getString("materialDeApoio");

                // precisa do id aqui?
                palestras = new Palestras(tituloDaPalestra, resumoDaPalestra, materialDeApoio);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return palestras;
    }
	
	public List<Palestras> getAll() {

        List<Palestras> listaPalestras = new ArrayList<>();

        // também tem que ver esse select aqui
        //String sql = "SELECT * FROM Pessoa, Autor where Pessoa.idPessoa = Autor.idAutor";

        String sql = "SELECT * from Palestras, Abordagem where Palestras.idPalestra = Abordagem.idAbordagem";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
            	String tituloDaPalestra = resultSet.getString("tituloDaPalestra");
                String resumoDaPalestra = resultSet.getString("resumoDaPalestra");
                String materialDeApoio = resultSet.getString("materialDeApoio");

                // precisa do id aqui?
                Palestras palestras = new Palestras(tituloDaPalestra, resumoDaPalestra, materialDeApoio);
                listaPalestras.add(palestras);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPalestras;
    }
}
