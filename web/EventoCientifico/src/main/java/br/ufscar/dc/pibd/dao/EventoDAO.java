package br.ufscar.dc.pibd.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.pibd.domain.Evento;

public class EventoDAO extends GenericDAO{

	public void insert(Evento evento) {
		
		String sql = "call InsertEvento(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, evento.getSigla());
            statement.setString(2, evento.getNomeExtenso());
            statement.setString(3, evento.getCep());
            statement.setInt(4, evento.getNumero());
            statement.setString(5, evento.getPais());
            statement.setString(6, evento.getEstado());
            statement.setString(7, evento.getCidade());
            statement.setString(8, evento.getBairro());
            statement.setString(9, evento.getLogradouro());
            statement.setString(10, evento.getComplemento());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
		
	}
	
	public Evento get(String sigla) {
		Evento evento = null;

		String sql = "SELECT * from Evento";/*
											 * "SELECT * from Evento, Pais, Estado, Cidade, Bairro, Cep where Evento.sigla = sigla"
											 * +
											 * "and Pais.pais = Estado.pais and Pais.estado = Estado.estado and Estado.cidade = Cidade.cidade"
											 * +
											 * "and Estado.estado = Cidade.estado and Cidade.bairro = Bairro.bairro and Cidade.cidade = Bairro.cidade"
											 * + "and Bairro.cep = Cep.cep and Bairro.bairro = Cep.bairro";
											 */

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, sigla);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String siglaEv = resultSet.getString("sigla");
                String nomeExtenso = resultSet.getString("nomeExtenso");
				/*
				 * String pais = resultSet.getString("pais"); String estado =
				 * resultSet.getString("estado"); String cidade = resultSet.getString("cidade");
				 * String bairro = resultSet.getString("bairro");
				 */
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
				/* String logradouro = resultSet.getString("logradouro"); */
                String complemento = resultSet.getString("complemento");

                evento = new Evento(siglaEv, nomeExtenso, cep, numero, complemento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return evento;
    }
	
	public List<Evento> getAll() {

        List<Evento> listaEvento = new ArrayList<>();

        String sql = "SELECT * FROM Evento";

        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();

            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
            	String sigla = resultSet.getString("sigla");
                String nomeExtenso = resultSet.getString("nomeExtenso");
				/*
				 * String pais = resultSet.getString("pais"); String estado =
				 * resultSet.getString("estado"); String cidade = resultSet.getString("cidade");
				 * String bairro = resultSet.getString("bairro");
				 */
                String cep = resultSet.getString("cep");
                int numero = resultSet.getInt("numero");
				/* String logradouro = resultSet.getString("logradouro"); */
                String complemento = resultSet.getString("complemento");

                Evento evento = new Evento(sigla, nomeExtenso, cep, numero, complemento);
                listaEvento.add(evento);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaEvento;
    }
}
